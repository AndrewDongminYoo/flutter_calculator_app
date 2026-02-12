# Calculator

[![calculator][workflows_badge]][workflow_action]
[![codecov][coverage_badges]][codecov_webpage]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

A cross-platform calculator project supporting CLI and Flutter-based UI. 🤖

This project demonstrates a layered architecture for calculating expressions with features like command-line interaction, Flutter UI, and localization.

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Screenshots](#screenshots-)
- [Getting Started](#getting-started-)
- [Running Tests](#running-tests-)
- [Windows Platform Support](#windows-platform-support)
- [Project Structure](#project-structure)
- [CLI Usage](#cli-usage)
- [Localization](#localization-)
- [License](#license)

---

## Overview

This project implements a calculator with two main interfaces:

1. **CLI Application**: A command-line interface for evaluating mathematical expressions.
2. **Flutter Application**: A mobile and desktop Flutter UI with interactive buttons.

The application is built with clean architecture principles:

- **Data Layer**: Manages data sources (local, remote).
- **Domain Layer**: Contains core business logic (entities, use cases).
- **Presentation Layer**: Includes CLI and Flutter UI components.

---

## Features

- **CLI Support**: Calculate expressions via command-line interaction.
- **Interactive UI**: Flutter-based calculator app with a responsive layout.
- **Localization**: Supports English and Korean.
- **Scalable Architecture**: Clean separation of concerns across layers.
- **Cross-Platform**: Works on iOS, Android, Windows, macOS, Web, and Linux.

---

## Getting Started 🚀

### Prerequisites

- Dart & Flutter SDK installed ([Installation Guide](https://docs.flutter.dev/get-started/install)).
- For CLI, ensure Dart is added to your system path.

### Running the Flutter Application

The project contains 3 flavors: development, staging, and production.

Use the following commands to run the desired flavor:

```sh
# Development
$ flutter run --flavor development --target lib/main.dart

# Staging
$ flutter run --flavor staging --target lib/main.dart

# Production
$ flutter run --flavor production --target lib/main.dart
```

_\*Calculator works on iOS, Android, Web, and Windows._

---

## Screenshots 📸

Below are screenshots demonstrating the application:

| **Initial Screen**                                                                   | **Successful Calculation**                                                                   | **Error Handling**                                                                   |
| ------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------ |
| ![Initial Screen](doc/images/Screenshot%202025-01-02%20at%2010.52.49%E2%80%AFAM.png) | ![Successful Calculation](doc/images/Screenshot%202025-01-02%20at%2010.53.13%E2%80%AFAM.png) | ![Error Handling](doc/images/Screenshot%202025-01-02%20at%2010.53.30%E2%80%AFAM.png) |

- **Initial Screen**: The home screen where users can input mathematical expressions.
- **Successful Calculation**: An example of a correct calculation being performed.
- **Error Handling**: How the app displays errors for invalid input or unsupported operations.

## Running Tests 🧪

To run all unit and widget tests, use the following command:

```sh
flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report, use [lcov](https://github.com/linux-test-project/lcov):

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

---

## Windows Platform Support

This section explains how to manage dependencies and build the Windows app, especially when your main development machine is macOS.

### 1) Dependency Management Principles

- The single source of truth for app/plugin dependencies is `pubspec.yaml`.
- Use `flutter pub get` (or `flutter pub upgrade`) to resolve and update dependencies.
- On Windows, plugin wiring for CMake is generated automatically by Flutter:
  - `windows/flutter/generated_plugins.cmake`
  - `windows/flutter/generated_plugin_registrant.cc`
- Do not edit generated files under `windows/flutter/generated_*` or `windows/flutter/ephemeral/*`.

#### What to edit (and what not to edit)

- `windows/flutter/CMakeLists.txt`: Flutter-managed; avoid manual edits.
- `windows/CMakeLists.txt`: Top-level Windows build settings; edit only when you need custom native build behavior.
- `windows/runner/CMakeLists.txt`: Runner target settings; edit only when adding custom C++ source files, compile flags, or manual native linking.

In most Flutter-only feature work, you do not need to edit any of these CMake files.

### 2) Build Constraints on macOS

- You cannot build a Windows desktop binary directly on macOS.
- Windows builds require a Windows toolchain (Visual Studio C++ and Windows SDK), so build on:
  - a physical Windows machine
  - a Windows VM
  - a CI runner (for example, GitHub Actions `windows-latest`)

### 3) Local Windows Build (on a Windows machine)

Prerequisites:

- Install Flutter SDK
- Install Visual Studio 2022 with `Desktop development with C++`
- Enable Windows desktop support:

```sh
flutter config --enable-windows-desktop
```

Build and run:

```sh
flutter pub get
flutter run -d windows
flutter build windows --release
```

Release output path:

```text
build/windows/x64/runner/Release/
```

### 4) CI/CD Setup Example (GitHub Actions)

If you develop on macOS, add a Windows build job so pull requests and pushes validate Windows continuously.

```yaml
windows-build:
  runs-on: windows-latest
  steps:
    - uses: actions/checkout@v4
    - uses: subosito/flutter-action@v2
      with:
        channel: stable
    - run: flutter pub get
    - run: flutter build windows --release
    - uses: actions/upload-artifact@v4
      with:
        name: windows-release
        path: build/windows/x64/runner/Release/
```

Tip: keep your existing Linux analysis/test jobs and add this Windows job in parallel for platform coverage.

---

## Project Structure

The project follows a modular structure:

```log
lib/
├── app/                         # Core app files
├── core/                        # Shared utilities
├── features/                    # Feature-based modular structure
│   └── calculator/              # Calculator feature
│       ├── data/                # Data layer (datasources, models)
│       ├── domain/              # Domain layer (entities, usecases)
│       ├── presentation/        # Presentation layer (UI, CLI)
├── l10n/                        # Localization resources
```

---

## CLI Usage

### Launching the CLI

Run the command:

```sh
dart run calculator:interpreter
```

### Available Commands

| Command   | Description                     |
| --------- | ------------------------------- |
| `help`    | Shows usage instructions.       |
| `history` | Displays previous calculations. |
| `clear`   | Clears the console (CLI only).  |
| `exit`    | Exits the application.          |

### Example Interaction

```sh
$ dart run calculator:interpreter
Building package executable...
Built calculator:interpreter.
======================================
       CLI Calculator (v1.0)
======================================
Type "help" for usage instructions or "exit" to quit.
> 1/5
Result: 0.2
> 1/4
Result: 0.25
> 1/3
Result: 0.3333333333333333
> 1/2
Result: 0.5
> 1/1
Result: 1.0
> 1/0
Result: Infinity
> history
Calculation History:
- 1/5 = 0.2
- 1/4 = 0.25
- 1/3 = 0.3333333333333333
- 1/2 = 0.5
- 1/1 = 1.0
- 1/0 = Infinity
> help
--------------------------------------
Instructions:
- Enter calculations (e.g., 2+3, 4*5/2).
- Supported operators: +, -, *, /.
- Commands:
  'help'     - Show usage instructions.
  'history'  - Show calculation history.
  'clear'    - Clear the console.
  'exit'     - Exit the application.
--------------------------------------
>
```

If you want to run a function that returns results immediately, please use the following command.

```sh
$ dart run calculator:calculate --help
Building package executable...
Built calculator:calculate.
Usage: dart run calculator:calculate <expression>
Example: dart run calculator:calculate "2+3"

$ dart run calculator:calculate 2+3
Building package executable...
Built calculator:calculate.
Result: 5.0
```

---

## Localization 🌐

This project supports multiple locales:

### Adding New Locales

1. Add ARB files in `lib/l10n/arb` for the new locale:

```log
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_ko.arb
```

2. Update localized strings in each file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "appTitle": "Calculator"
}
```

`app_ko.arb`

```arb
{
    "@@locale": "ko",
    "appTitle": "계산기"
}
```

3. Generate the localizations:

```sh
flutter gen-l10n --arb-dir="lib/l10n/arb"
```

Alternatively, run `flutter run` and code generation will take place automatically.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

[workflows_badge]: https://github.com/AndrewDongminYoo/flutter_calculator_app/actions/workflows/main.yaml/badge.svg
[workflow_action]: https://github.com/AndrewDongminYoo/flutter_calculator_app/actions/workflows/main.yaml
[coverage_badges]: https://codecov.io/github/AndrewDongminYoo/flutter_calculator_app/graph/badge.svg?token=DN8JFS4PFT
[codecov_webpage]: https://codecov.io/github/AndrewDongminYoo/flutter_calculator_app
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
