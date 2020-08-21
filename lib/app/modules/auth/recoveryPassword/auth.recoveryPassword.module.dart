import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth.recoveryPassword.controller.dart';
import 'auth.recoveryPassword.page.dart';

class AuthRecoveryPasswordModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthRecoveryPasswordController>(
            create: (_) => AuthRecoveryPasswordController()),
      ],
      child: AuthRecoveryPasswordPage(),
    );
  }
}