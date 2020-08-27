# Flutter Boostrap

Padrão de estrutura Flutter usando provider e mobx.

Idiomas: [Inglês](README.md), Português do Brasil (esse arquivo)

- [Requisitos](#requisitos)
- [Iniciando](#iniciando)
- [Pacotes](#pacotes)
- [Recursos](#recursos)
- [Padrões](#padrões)
- [Multi Lingua](#multi-lingua)
- [Tema](#tema)
- [TODO](#todo)

## Requisitos

- [Flutter](https://flutter.dev/docs/get-started/install)

## Iniciando

Dentro da pasta do aplicativo (raiz), execute os seguintes comandos:

**Obter pacotes:**

```shell
flutter pub get
```

**Construir:**

```shell
 flutter pub run build_runner
```

ou para reconstruir automaticamente:

```shell
 flutter pub run build_runner watch
```

**Execute o aplicativo:**

```shell
 flutter run
```

## Pacotes

- [mobx](https://pub.dev/packages/mobx)
- [provider](https://pub.dev/packages/provider)
- [i18n_extension](https://pub.dev/packages/i18n_extension)
- [hive](https://pub.dev/packages/hive)
- [hive_flutter](https://pub.dev/packages/hive_flutter)
- [path_provider](https://pub.dev/packages/path_provider)

Pacotes de desenvolvedor

- [mobx_codegen](https://pub.dev/packages/mobx_codegen)
- [build_runner](https://pub.dev/packages/build_runner)
- [hive_generator](https://pub.dev/packages/hive_generator)  


## Recursos

- Tradução e internacionalização (i18n_extension)
- Sistema de cache (hive)
- Gerenciamento de estado desacoplado (mobx + provider)
- Validações de formulários
- Componentes básicos desacoplados:
  - Campos, snackbar, drawer, botões, etc.

## Padrões

### Código

O código precisa seguir o [Linter for Dart](https://dart-lang.github.io/linter/lints/index.html).

### Estrutura de pastas e nomes de arquivos

Todos os nomes das pastas devem seguir o padrão "lowerCamelCase":

```
- superModuleName
```

Todos os nomes de arquivos precisam seguir "lowerCamelCase" prefixado com o nome da estrutura das pastas pai (no singular):

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

Dentro da pasta "core", temos apenas o essencial para fazer o aplicativo funcionar, como MaterialApp, rotas, tema e tela inicial.

#### Module

Todos os módulos personalizados devem permanecer dentro da pasta "modules" e respeitar a estrutura básica de gerenciamento de estado:

```
- mymodule
    mymodule.module.dart
    mymodule.controller.dart
    mymodule.page.dart
```

#### Shared

Dentro da pasta "shared" guardamos tudo o que pode ser compartilhado com outros módulos. Exemplo: models, repositories, services, widgets, etc.

Os arquivos dentro de "**shared/utils**" não precisam ter o prefixo das pastas pai.

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

## Multi Lingua

O aplicativo precisa ser multilíngue por padrão. Declare todas as strings dentro de "**app/shared/utils/i18n/i18n.translate.dart**":

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

Dentro de "**app/shared/utils/i18n/locales**" adicione todos os arquivos "locale": Exemplo:

```
- app/shared/utils/i18n
	-- locales
		en-US.dart
		pt-BR.dart
```

Dentro de cada "locales", implemente todas as traduções de strings.
Exemplo em en-US.dart:

```dart
import '../i18n.translate.dart';

class I18nStrings implements I18nTranslate {
  String appName = 'Flutter Bootstrap';
  String home = 'Home';
  String validatorEmail = 'Invalid email';
  String validatorIsNotEmpty = 'Can\'t be empty';
}
```

No "**app/shared/utils/i18n/i18n.config.dart**" você define a string de origem e sua tradução. Exemplo:

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

Para usar:

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

### Suporte de línguas

Certifique-se de que você adicionou "**flutter_localizations**" sdk no seu "**pubspec.yaml**".

```yml
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
```

Dentro de "**MaterialApp**" informe o "**localizationsDelegates**" e "**supportedLocales**". Exemplo:

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

## Tema

O tema padrão é declarado em "**app/core/themes/core.themes.default.dart**", aqui você pode personalizar o seu tema.

Evite usar cores "sem constante" dentro de seu aplicativo, de preferência, declare as cores em "**app/core/themes/colors/core.theme.color.default.dart**". Exemplo:

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

Para usar:

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

- Testes unitários e de Widget (UI).
