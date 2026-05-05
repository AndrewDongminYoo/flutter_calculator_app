// ignore_for_file: avoid_print
import 'dart:io';

Future<void> main() async {
  final root = Platform.script.resolve('../');
  final file = File.fromUri(root.resolve('pubspec.yaml'));
  final content = await file.readAsString();

  final re = RegExp(r'^version:\s*(\d+)\.(\d+)\.(\d+)\+(\d+)', multiLine: true);
  final m = re.firstMatch(content);
  if (m == null) {
    stderr.writeln('Error: version not found in pubspec.yaml');
    exit(1);
  }

  final newVersion = '${m[1]}.${m[2]}.${int.parse(m[3]!) + 1}+${m[4]}';
  await file.writeAsString(content.replaceFirst(re, 'version: $newVersion'));
  print('Version bumped to $newVersion');
}
