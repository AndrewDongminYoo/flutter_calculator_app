// ignore_for_file: avoid_print
import 'dart:io';

const _sections = {
  'feat': 'Features',
  'fix': 'Bug Fixes',
  'perf': 'Performance Improvements',
  'docs': 'Documentation',
};

final Uri _root = Platform.script.resolve('../');

Future<void> main() async {
  final pubspecFile = File.fromUri(_root.resolve('pubspec.yaml'));
  final pubspec = await pubspecFile.readAsString();
  final versionRe = RegExp(r'^version:\s*(\d+)\.(\d+)\.(\d+)\+(\d+)', multiLine: true);
  final vm = versionRe.firstMatch(pubspec);
  if (vm == null) {
    stderr.writeln('Error: version not found in pubspec.yaml');
    exit(1);
  }
  final newVersion = '${vm[1]}.${vm[2]}.${int.parse(vm[3]!) + 1}';
  final newVersionFull = '$newVersion+${vm[4]}';
  print('Releasing $newVersion (was ${vm[1]}.${vm[2]}.${vm[3]})');

  // Fire both reads in parallel — no dependency between them
  final remoteFuture = _capture('git', ['remote', 'get-url', 'origin']);
  final lastTagFuture = Process.run(
    'git',
    ['describe', '--tags', '--abbrev=0'],
    workingDirectory: _root.toFilePath(),
  );
  final remote = (await remoteFuture).trim();
  final lastTagResult = await lastTagFuture;

  final repoUrl = remote
      .replaceFirstMapped(RegExp('^git@([^:]+):'), (m) => 'https://${m[1]}/')
      .replaceFirst(RegExp(r'\.git$'), '');

  final rangeArg = lastTagResult.exitCode == 0 ? '${(lastTagResult.stdout as String).trim()}..HEAD' : null;
  final log = await _capture('git', [
    'log',
    ?rangeArg,
    '--pretty=format:%H %s',
    '--no-merges',
  ]);

  final groups = <String, List<String>>{for (final k in _sections.keys) k: []};
  final commitRe = RegExp(r'^([a-z]+)(?:\([^)]+\))?!?: (.+)$');
  for (final line in log.trim().split('\n').where((l) => l.isNotEmpty)) {
    final sp = line.indexOf(' ');
    if (sp == -1) continue;
    final hash = line.substring(0, sp);
    final subject = line.substring(sp + 1);
    final cm = commitRe.firstMatch(subject);
    if (cm == null || !groups.containsKey(cm[1])) continue;
    groups[cm[1]]!.add('- ${cm[2]} ([${hash.substring(0, 7)}]($repoUrl/commit/$hash))');
  }

  final date = DateTime.now().toIso8601String().substring(0, 10);
  final sections = _renderSections(groups);

  const header = '# Changelog\n';
  final clFile = File.fromUri(_root.resolve('CHANGELOG.md'));
  String existing;
  try {
    existing = await clFile.readAsString();
  } on FileSystemException {
    existing = '$header\n';
  }
  final tail = existing.startsWith(header) ? existing.substring(header.length) : '\n$existing';
  await clFile.writeAsString('$header\n## $newVersion ($date)\n\n$sections$tail');

  await pubspecFile.writeAsString(pubspec.replaceFirst(versionRe, 'version: $newVersionFull'));
  print('pubspec.yaml updated to $newVersionFull');

  await _exec('git', ['add', 'pubspec.yaml', 'CHANGELOG.md']);
  await _exec('git', ['commit', '-m', 'chore: release v$newVersion']);
  await _exec('git', ['tag', '-a', 'v$newVersion', '-m', 'Release v$newVersion']);
  await _exec('git', ['push', 'origin', 'HEAD', 'v$newVersion']);

  final tmp = File('${Directory.systemTemp.path}/calc_release_notes.md');
  await tmp.writeAsString(sections.trimRight());
  try {
    await _exec('gh', [
      'release',
      'create',
      'v$newVersion',
      '--title',
      'Release v$newVersion',
      '--notes-file',
      tmp.path,
    ]);
  } finally {
    if (tmp.existsSync()) await tmp.delete();
  }

  print('Released v$newVersion successfully!');
}

String _renderSections(Map<String, List<String>> groups) {
  final buf = StringBuffer();
  for (final MapEntry(:key, :value) in _sections.entries) {
    final items = groups[key]!;
    if (items.isEmpty) continue;
    buf.writeln('### $value');
    buf.writeln();
    items.forEach(buf.writeln);
    buf.writeln();
  }
  return buf.toString();
}

Future<String> _capture(String cmd, List<String> args) async {
  final r = await Process.run(cmd, args, workingDirectory: _root.toFilePath());
  if (r.exitCode != 0) {
    stderr.writeln('Error: $cmd ${args.join(' ')}\n${r.stderr}');
    exit(r.exitCode);
  }
  return r.stdout as String;
}

Future<void> _exec(String cmd, List<String> args) async {
  final p = await Process.start(
    cmd,
    args,
    workingDirectory: _root.toFilePath(),
    mode: ProcessStartMode.inheritStdio,
  );
  final code = await p.exitCode;
  if (code != 0) exit(code);
}
