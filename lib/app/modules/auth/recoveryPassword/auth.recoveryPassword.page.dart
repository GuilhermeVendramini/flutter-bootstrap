import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/app/shared/utils/i18n/i18n.config.dart';

class AuthRecoveryPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(i18nDefault.recovery.i18n),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Text('TODO'),
        ),
      ),
    );
  }
}