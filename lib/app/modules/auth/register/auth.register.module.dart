import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/app/core/core.controller.dart';
import 'package:provider/provider.dart';

import 'auth.register.controller.dart';
import 'auth.register.page.dart';

class AuthRegisterModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthRegisterController>(
          create: (_) => AuthRegisterController(
            coreController: Provider.of<CoreController>(context),
          ),
        ),
      ],
      child: AuthRegisterPage(),
    );
  }
}
