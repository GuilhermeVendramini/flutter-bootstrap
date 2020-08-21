import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/app/shared/utils/i18n/i18n.config.dart';

import 'widgets/blocks/auth.login.widget.block.login.dart';

class AuthLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(i18nDefault.login.i18n),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: AuthLoginWidgetBlockLogin(),
        ),
      ),
    );
  }
}