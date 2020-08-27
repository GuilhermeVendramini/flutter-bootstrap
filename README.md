# Flutter Boostrap

Flutter structure pattern using provider and mobx.

Languages: English (this file), [Brazilian Portuguese](README.pt-br.md)

- [Requirements](#requirements)
- [Starting](#starting)
- [Packages](#packages)
- [Features](#features)
- [Patterns](#patterns)
- [Multi Language](#multi-language)
- [Theme](#theme)
- [TODO](#todo)

## Requirements

- [Flutter](https://flutter.dev/docs/get-started/install)

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

or to auto rebuild:

```shell
 flutter pub run build_runner watch
```

**Run the app:**

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

## Patterns

### Code

The code needs to follow the [Linter for Dart](https://dart-lang.github.io/linter/lints/index.html).

### Folders structure and filenames

All folders name needs to follow "lowerCamelCase" pattern:

```
- superModuleName
```

All filenames needs to follow "lowerCamelCase" prefixed with parent folders structure name (in the singular):

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
- mymodule
    mymodule.module.dart
    mymodule.controller.dart
    mymodule.page.dart
```

#### Shared

Inside shared folder we keep everything that can be shared with another modules. Example: models, repositories, services, widgets, etc.

Files inside "**shared/utils**" don't need to have the prefix of the parent folder structure".

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

## Multi Language

The app needs to be multi-language by default. Declare all strings inside "**app/shared/utils/i18n/i18n.translate.dart**":

```dart
 abstract class I18nTranslate {
 /*
 * Generic
 * */
  String appName;
  String welcomeMessage;

/*
* Validators
* */

String validatorIsNotEmpty;
String validatorMinLength;
}
```

Inside "**app/shared/utils/i18n/locales**" add all "locale" files: Example:

```
- app/shared/utils/i18n
	-- locales
		en-US.dart
		pt-BR.dart
```

Inside each "locales", implement all strings translations.
Example in en-US.dart:

```dart
import '../i18n.translate.dart';

class I18nStrings implements I18nTranslate {
  String appName = 'Flutter Bootstrap';
  String home = 'Home';
  String validatorEmail = 'Invalid email';
  String validatorIsNotEmpty = 'Can\'t be empty';
}
```

In "**app/shared/utils/i18n/i18n.config.dart**" you define the origin string and your translation. Example:

```dart
import 'package:i18n_extension/i18n_extension.dart';

import './locales/en-US.dart' as enUS;
import './locales/pt-BR.dart' as ptBR;
import 'i18n.translate.dart';

final I18nTranslate _i18nEnUS = enUS.I18nStrings();
final I18nTranslate _i18nPtBR = ptBR.I18nStrings();
final I18nTranslate i18nDefault = _i18nEnUS;

extension Localization on String {
  static var t = Translations("en_us") +
      {
        "en_us": _i18nEnUS.appName,
        "pt_br": _i18nPtBR.appName,
      } +
      {
        "en_us": _i18nEnUS.home,
        "pt_br": _i18nPtBR.home,
      } +
      {
        "en_us": _i18nEnUS.authLoginErrorMessage,
        "pt_br": _i18nPtBR.authLoginErrorMessage,
      };

  String get i18n => localize(this, t);
}
```

To use:

```dart
class CoreWidgetPageNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(i18nDefault.coreNotFoundPage.i18n),
      ),
      body: Text(
	      i18nDefault.coreNotFoundMessage.i18n,
      ),
    );
  }
}
```

### Language support

Make sure that you added "**flutter_localizations**" sdk in your "**pubspec.yaml**".

```yml
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
```

Inside "**MaterialApp**" inform the "**localizationsDelegates**" and "**supportedLocales**". Example:

```dart
class CoreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bootstrap',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', "US"),
        const Locale('pt', "BR"),
      ],
```

## Theme

The default theme is declared in "**app/core/themes/core.themes.default.dart**", here you can customize your theme.

Avoid using "no constant" colors inside your app, preferably declare the app colors in "**app/core/themes/colors/core.theme.color.default.dart**". Example:

```dart
import "package:flutter/material.dart";

class CoreThemeColorDefault {
  static const identityColor = Colors.blueGrey;
  static const primaryColor = Colors.black;
  static const accentColor = Colors.blueGrey;
  static const splashColor = Colors.black12;
  static const iconsColor = Colors.white;
  static const white = Colors.white;
}
```

To use:

```dart
class CoreThemesDefault {
  CoreThemesDefault._();

  static ThemeData themeData = ThemeData(
    primaryColor: CoreThemeColorDefault.primaryColor,
    accentColor: CoreThemeColorDefault.accentColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
	  backgroundColor: CoreThemeColorDefault.identityColor,
	),
```

## TODO

- Unit and Widgets (UI) tests
