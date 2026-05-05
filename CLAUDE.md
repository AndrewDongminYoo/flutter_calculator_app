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

# Code generation (freezed, json_serializable, flutter_gen, l10n)
merry generate

# Format + import sort
merry format

# Tests with coverage
merry test              # cleans coverage/, runs tests, generates HTML report

# Run a single test file
flutter test test/calculator_test.dart

# CLI interfaces
dart run calculator:interpreter          # interactive REPL
dart run calculator:calculate "2+3*4"    # one-shot expression evaluation

# Production builds
merry build ipa         # iOS archive + IPA
merry build aab         # Android App Bundle
merry build apk         # Android APK
```

## Architecture

Clean architecture with three layers. The package name is `calculator`.

```log
lib/
├── data/
│   ├── datasources/    # CalculatorLocalDatasource, CalculatorRemoteDatasource
│   ├── models/         # Freezed + json_serializable data models
│   └── repositories/   # CalculatorRepositoryImpl
├── domain/
│   ├── entities/       # Freezed domain entities (CalculationResult)
│   ├── repositories/   # CalculatorRepository (abstract)
│   └── usecases/       # CalculateExpression
├── presentation/
│   ├── bloc/           # CalculatorBloc (Freezed events/states)
│   ├── pages/          # CalculatorScreen
│   ├── widgets/        # CalculatorButton
│   ├── enums/          # ButtonType
│   └── cli/            # CalculatorCli
├── gen/                # flutter_gen output (assets, fonts) — do not edit
└── l10n/
    ├── arb/            # Source translation files (app_ko.arb is the template)
    └── gen/            # flutter gen-l10n output — do not edit
bin/
├── calculate.dart      # CLI one-shot entry point
└── interpreter.dart    # CLI REPL entry point
```

### Key Design Decision: Dual Datasource with Connectivity Routing

`CalculatorRepositoryImpl` checks network connectivity on every `calculate()` call:

- **Online** → `CalculatorRemoteDatasource` (uses `math_expressions` package with `ShuntingYardParser`)
- **Offline or remote failure** → `CalculatorLocalDatasource` (custom tokenizer + shunting-yard evaluator)

The local datasource only supports `+`, `-`, `*`, `/` operators. The remote datasource (via `math_expressions`) handles more complex expressions including `%`.

### State Management

`CalculatorBloc` manages three state fields (`equation`, `result`, `expression`) using Freezed-generated `copyWith`. Events: `Clear`, `Delete`, `FlipSign`, `Input`, `Evaluate`. The UI translates display operators (`×`, `÷`) back to ASCII (`*`, `/`) before evaluation.

## Code Style

- Formatter line length: **120 characters** (configured in `analysis_options.yaml`)
- Import order enforced by `import_sorter`: Dart → Flutter → Package → Project (with emoji group headers)
- Linter: `very_good_analysis` with local overrides — always use package imports (`always_use_package_imports: true`), prefer single quotes, require trailing commas
- All generated files (`*.g.dart`, `*.freezed.dart`) are excluded from analysis

## Code Generation

Run `merry generate` after modifying:

- Any class annotated with `@freezed`, `@JsonSerializable`, or `@GenerateMocks`
- ARB files in `lib/l10n/arb/` (l10n template is `app_ko.arb`)
- Asset files in `assets/` (flutter_gen updates `lib/gen/`)

## Flavors

Three flavors: `development`, `staging`, `production`. Build commands in `merry.yaml` always target `production`.

## Localization

- Template file: `lib/l10n/arb/app_ko.arb` (Korean is primary)
- Add new strings to both `app_ko.arb` and `app_en.arb` with `@` metadata attributes (required by `--required-resource-attributes`)
- Regenerate with `merry gen-l10n` or `merry generate`
