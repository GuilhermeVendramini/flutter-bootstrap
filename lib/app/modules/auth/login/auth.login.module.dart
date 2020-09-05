import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/app/core/core.controller.dart';
import 'package:provider/provider.dart';

import 'auth.login.controller.dart';
import 'auth.login.page.dart';

class AuthLoginModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthLoginController>(
          create: (_) => AuthLoginController()
            ..setBond(Provider.of<CoreController>(context)),
        ),
      ],
      child: AuthLoginPage(),
    );
  }
}
