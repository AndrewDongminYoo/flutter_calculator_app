# Changelog

## <small>1.0.1 (2025-05-31)</small>

- feat: ✨ add dart formatter to trunk ([3cd09d1](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/3cd09d1))
- feat: ✨ add dart import sorter pre-commit hook ([f564e56](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/f564e56))
- feat: ✨ clear buffer after tokenizing input ([1c95b52](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/1c95b52))
- feat: ✨ configure localization ([349fda9](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/349fda9))
- feat: ✨ improve calculator tokenization with constants ([2f689a3](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/2f689a3))
- feat: ✨ initial project setup with package.json and gitignore ([1a0217c](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/1a0217c))
- feat: ✨ prevent calculation of empty expressions ([6fac0d9](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/6fac0d9))
- feat: ✨ upgrade very_good_analysis and update linting rules ([033a874](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/033a874))
- fix: 🐛 add "infile" to cspell flutter dictionary ([a0a4e47](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/a0a4e47))
- fix: 🐛 correct documentation and imports ([694f744](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/694f744))
- fix: 🐛 fix dart import sorter pre-commit hook to check for sorted files ([db7236f](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/db7236f))
- fix: 🐛 update pubspec dependencies ([9d74f20](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/9d74f20))
- fix: 🐛 update trunk linters ([6d07d18](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/6d07d18))
- fix: 🐛 upgrade cspell-action to v7 ([42dc88f](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/42dc88f))
- chore: ⬆️ bump dependencies ([00837c5](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/00837c5))
- chore: ⬆️ bump trunk cli and linters ([9b5d1ff](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/9b5d1ff))
- chore: ⬆️ upgrade trunk tooling ([cbf1e06](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/cbf1e06))
- chore: ⬆️ upgrade very_good_analysis to v8.0.0 ([c6663da](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/c6663da))
- chore(deps): bump streetsidesoftware/cspell-action from 7.0.0 to 7.0.1 ([2a4d16d](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/2a4d16d))
- refactor: ♻️ update derry commands and add posttest command ([e667e56](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/e667e56))
- refactor: ♻️ update imports for localization ([741a875](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/741a875))

## 1.0.0 (2025-04-06)

### Features

- ✨ add command-line functionality for immediate calculations with usage instructions ([632d923](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/632d923dfbeae25a6a0607f8b3da5f22469c82b3))
- ✨ add mockito for unit testing and implement connectivity-aware repository tests ([6d4c1ba](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/6d4c1ba8e74f27c0abbc455441f339fac679bb42))
- ✨ enhance calculator logic with tokenization and expression evaluation ([17d4851](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/17d48516327269c04b1aeb61df7c58000e282eaa))
- ✨ enhance CLI calculator with command history, help instructions, and console clearing functionality ([a4e3619](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/a4e36194d74a56b21cd5b3c9a3e6d977a469457a))
- ✨ implement calculator with clean architectures ([34a30a0](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/34a30a07eab5441898d898a89eb4479d256db241))
- ✨ implement CLI calculator and local datasource for basic arithmetic operations ([ba45ee1](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/ba45ee1b7981c3380852ecd7f493dcbaf59274da))
- ✨ implement remote datasource for expression evaluation with unit tests ([8fd0dfe](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/8fd0dfe6021307ed58211b31943ff385452d6ca5))
- ✨ improve error handling in CLI calculator for better user feedback ([2848320](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/2848320a2bad6d25500be4ea73ab9965fd3b932b))
- ✨ integrate CalculatorRepository into CalculatorBloc for improved evaluation handling ([1a7308b](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/1a7308b1c323bb55f38cb154cc69332c2fb79fc5))
- ✨ integrate connectivity_plus for network-aware calculations in CalculatorRepository ([c8d1bff](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/c8d1bff6452366f5ad50d29ac67e679b880230d2))
- ➕ add auto_size_text dependency ([79b0a4a](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/79b0a4a594d6a62bc787b3731d2aca39acd94c99))
- ➕ add connectivity_plus dependency and configure for iOS and macOS ([55e7f44](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/55e7f44e48b9185d470fd5ef9ce4569d49249eb3))
- ➕ add math_expressions dependency to pubspec.yaml and update pubspec.lock ([69a2542](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/69a254296ef3421f123aa0c418e9ae1115a707b3))
- ➕ implement calculator screen with button types and functionality ([ca579c7](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/ca579c7584d65c822c7b2f4f801f909becd826c4))
- ⬆️ upgrade multiple dependencies including bloc, flutter_bloc, and freezed ([acc3d07](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/acc3d078bca63165f3bdc3634e8e6fbfb34422f7))
- 🎯 add logging for internet connection status in calculate method ([fc823c8](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/fc823c8441546d8653eb236b8efce39a84166654))

### Bug Fixes

- ✅ update division by zero handling to return double.infinity instead of throwing ArgumentError ([5f7b096](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/5f7b096948a9a5f441384c3e8fba19a371b0a52a))
- ✅ update error handling in calculator_local_datasource_test to throw UnsupportedError for invalid number format ([4f3148a](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/4f3148a0a5b36e6de4be5d70d2940081d696986f))
- ✅ update test to render CalculatorScreen instead of CounterPage ([66df7e3](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/66df7e3e81c0d1fa3fb44c8c0d528df6e4df5079))
- 🐛 correct minus button representation in ButtonType enum ([e1c2533](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/e1c2533b31b9ea269cdc5b333c4fd8383e3c88f6))
- 🐛 use ShuntingYardParser instead of Parser in CalculatorRemoteDatasource ([ab71907](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/ab7190765955650754e79f63121842a64b7f1037))
- 💄 optimize layout structure in CalculatorButton widget ([ad67ebd](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/ad67ebd125d14b16b3280c263923b16f7173203f))

### Documentation

- 📝 update README with project overview, features, and CLI usage instructions ([8d99af5](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/8d99af519b5275d18553c20433fe966a2bd73704))
- 📸 add screenshots section to README with examples of app functionality ([4ba3b80](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/4ba3b80361fefcf1714ca2443be930681cbedf82))
- create MIT License documents ([0a3a561](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/0a3a5617c992acc25cd4e92774e583cf3d5b314d))
- show in README.md if recent Actions CI passes ([8b54596](https://github.com/AndrewDongminYoo/flutter_calculator_app/commit/8b5459682d6743a96accc56b7b4fb04d3cd70f7b))
