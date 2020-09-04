import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/app/modules/auth/login/auth.login.module.dart';
import 'package:flutter_bootstrap/app/modules/auth/recoveryPassword/auth.recoveryPassword.module.dart';
import 'package:flutter_bootstrap/app/modules/auth/register/auth.register.module.dart';
import 'package:flutter_bootstrap/app/modules/home/home.module.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:provider/provider.dart';

import 'core.controller.dart';
import 'themes/core.themes.default.dart';
import 'widgets/pages/notFound/core.widget.page.notFound.dart';
import 'widgets/pages/splash/core.widget.page.splash.dart';

class CoreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CoreController _coreController = Provider.of<CoreController>(context);

    return MaterialApp(
      key: Key('MaterialApp'),
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
      theme: CoreThemesDefault.themeData,
      initialRoute: '/',
      routes: {
        '/': (context) => I18n(
              child: CoreWidgetPageSplash(_coreController),
            ),
        '/home': (context) => I18n(
              child: HomeModule(),
            ),
        '/login': (context) => I18n(
              child: AuthLoginModule(),
            ),
        '/register': (context) => I18n(
              child: AuthRegisterModule(),
            ),
        '/recovery': (context) => I18n(
              child: AuthRecoveryPasswordModule(),
            ),
      },
      onUnknownRoute: (RouteSettings setting) {
        return MaterialPageRoute(
          builder: (context) => I18n(
            child: CoreWidgetPageNotFound(),
          ),
        );
      },
    );
  }
}
