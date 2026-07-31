# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Common Commands

Scripts are managed via `merry` (`dart pub global activate merry`), configured in `merry.yaml`. All commands below use it.

```bash
# Initial setup after cloning
dart pub global activate merry
merry bootstrap         # pub get + code generation + format

# Development
flutter run --flavor development --target lib/main.dart

# Code generation (freezed, flutter_gen, mockito)
merry generate

# Format + import sort (dart fix, dart format, import_sorter)
merry format

# Tests with coverage
merry test              # cleans coverage/, runs tests, generates HTML report

# Run a single test file
flutter test test/calculator_test.dart

# CLI interfaces
dart run calculator:interpreter          # interactive REPL
dart run calculator:calculate "2+3*4"    # one-shot expression evaluation

# Version management — pure Dart scripts in scripts/
merry version bump      # bumps pubspec.yaml patch version
merry version release   # bump → CHANGELOG → git commit + tag + push → GitHub release (requires gh CLI)

# Production builds
merry build ipa         # iOS archive + IPA
merry build aab         # Android App Bundle
merry build apk         # Android APK
```

## Architecture

Clean architecture with three layers. The package name is `calculator`.

```log
lib/
├── app/
│   └── app.dart        # MaterialApp root (theme, localization delegates)
├── core/
│   └── utils/          # size_utils.dart (BuildContext extension)
├── data/
│   ├── datasources/    # CalculatorLocalDatasource, CalculatorRemoteDatasource
│   └── repositories/   # CalculatorRepositoryImpl
├── domain/
│   └── repositories/   # CalculatorRepository (abstract)
├── presentation/
│   ├── bloc/           # CalculatorBloc (Freezed events/states)
│   ├── pages/          # CalculatorScreen
│   ├── widgets/        # CalculatorButton
│   ├── enums/          # ButtonType
│   └── cli/            # CalculatorCli
├── gen/                # flutter_gen output (assets, fonts) — do not edit
└── main.dart           # App entry point
bin/
├── calculate.dart      # CLI one-shot entry point
└── interpreter.dart    # CLI REPL entry point
```

`CalculatorRepository.calculate` returns a plain `double`, so there is no entity or
DTO layer — the bloc formats the number for display itself.

### Key Design Decision: Dual Datasource with Connectivity Routing

`CalculatorRepositoryImpl` checks network connectivity on every `calculate()` call:

- **Online** → `CalculatorRemoteDatasource` (uses `math_expressions` package with `ShuntingYardParser`)
- **Offline or remote failure** → `CalculatorLocalDatasource` (custom tokenizer + shunting-yard evaluator)

The local datasource only supports `+`, `-`, `*`, `/` operators. The remote datasource (via `math_expressions`) handles more complex expressions including `%`.

### State Management

`CalculatorBloc` manages three state fields (`equation`, `result`, `expression`) using Freezed-generated `copyWith`. Events: `Clear`, `Delete`, `FlipSign`, `Input`, `Evaluate`, `Paste`. The UI translates display operators (`×`, `÷`) back to ASCII (`*`, `/`) before evaluation.

`expression` holds the ASCII expression that produced the current `result`, and every
event that edits `equation` clears it. That makes `CalculatorState.hasResult` the single
signal for "the displayed result belongs to the current equation" — the UI uses it for
the AC/⌫ toggle and the long-press copy menu. Do not reintroduce `result != '0'` as a
"has a result" test: a legitimate answer of zero (`2-2=`) is indistinguishable from the
initial state that way.

## Code Style

- Formatter line length: **120 characters** (configured in `analysis_options.yaml`)
- Import order enforced by `import_sorter`: Dart → Flutter → Package → Project (with emoji group headers)
- Linter: `very_good_analysis` with local overrides — always use package imports (`always_use_package_imports: true`), prefer single quotes, require trailing commas
- All generated files (`*.g.dart`, `*.freezed.dart`) are excluded from analysis

## Code Generation

Run `merry generate` after modifying:

- Any class annotated with `@freezed` or `@GenerateMocks`
- Asset files in `assets/` (flutter_gen updates `lib/gen/`)

## Flavors

Three flavors: `development`, `staging`, `production`. Build commands in `merry.yaml` always target `production`.

## Localization

The app has no ARB files: every string it draws is a glyph or a digit.
`lib/app/app.dart` still registers the three `flutter_localizations` delegates and
declares `supportedLocales: [ko, en]` so that SDK-provided labels — the copy/paste
context menu on the result display, for one — follow the device locale instead of being
hardcoded. Add app-owned ARB files only when the UI grows real prose.
