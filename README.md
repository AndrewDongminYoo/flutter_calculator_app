# Calculator

![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

A cross-platform calculator project supporting CLI and Flutter-based UI. 🤖

This project demonstrates a layered architecture for calculating expressions with features like command-line interaction, Flutter UI, and localization.

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Getting Started](#getting-started-)
- [Running Tests](#running-tests-)
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

## Project Structure

The project follows a modular structure:

```log
lib/
├── app/                         # Core app files
├── core/                        # Shared utilities
├── features/                    # Feature-based modular structure
│   ├── calculator/              # Calculator feature
│   │   ├── data/                # Data layer (datasources, models)
│   │   ├── domain/              # Domain layer (entities, usecases)
│   │   ├── presentation/        # Presentation layer (UI, CLI)
│   └── counter/                 # Example counter feature
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

[coverage_badge]: coverage_badge.svg
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
