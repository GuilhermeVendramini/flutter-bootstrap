# Flutter Boostrap

### Requirements

* [Flutter](https://flutter.dev/docs/get-started/install)

## Starting

Inside the app folder (root) run the following commands:

**Get packages:**
```shell
flutter pub get
```
**Build:**
```shell
 flutter pub run build_runner
```
or to build in real-time:

```shell
 flutter pub run build_runner watch
```
run:

```shell
 flutter run
```

## Packages

  - [mobx](https://pub.dev/packages/mobx)
  - [provider](https://pub.dev/packages/provider)
  - [i18n_extension](https://pub.dev/packages/i18n_extension)
  - [hive](https://pub.dev/packages/hive)
  - [hive_flutter](https://pub.dev/packages/hive_flutter)
  - [path_provider](https://pub.dev/packages/path_provider)

Developer packages

- [mobx_codegen](https://pub.dev/packages/mobx_codegen)
- [build_runner](https://pub.dev/packages/build_runner)
- [hive_generator](https://pub.dev/packages/hive_generator)
  
## Features
  - Translation and Internationalization (i18n_extension)
  - Cache system (hive)
  - Decoupled state management (mobx + provider)
  - Forms Validations
  - Basic decoupled components: 
	  - Fields, snackbar, drawer, buttons, etc.

TODO
- Unit and Widget (UI) tests

## Patterns

### Code

The code needs to follow the [Linter for Dart](https://dart-lang.github.io/linter/lints/index.html).

### Folders structure

All folders name needs to follow "lowerCamelCase" pattern:
```
- superModuleName
```
All files name needs to follow "lowerCamelCase" prefixed with parent folder structure name (in singular):  

```
- superModuleName
	-- widgets
		--- blocks
			superModuleName.widget.block.main.dart
			superModuleName.widget.block.details.dart
		--- lists
			superModuleName.widget.list.event.dart
			superModuleName.widget.list.holidayEvents.dart
	superModuleName.module.dart
	superModuleName.controller.dart
	superModuleName.page.dart
```

#### Core

Inside core folder we have just the essential to make the app run, like MaterialApp, routes, theme and the starter screen.

#### Module

All custom modules should stay inside modules folder and respect the basic state management structure:

```
- module
	module.module.dart
	module.controller.dart
	module.page.dart
```
#### Shared

Inside shared folder we keep everything that can be shared with another modules, like: models, repositories, services, widgets, etc.

Files inside "**shared/utils**" don't need to add the parent prefix folder structure.

```
- shared
	-- utils
		--- snackbars
            snackbar.default.dart
            snackbar.custom.dart
		--- i18n
		    ---- locales
		        en-US.dart
		        pt-BR.dart
            i18n.config.dart
            i18n.translate.dart
```