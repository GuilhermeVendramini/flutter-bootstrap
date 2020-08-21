import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/app/modules/auth/login/widgets/forms/auth.login.widget.block.form.dart';
import 'package:flutter_bootstrap/app/shared/utils/i18n/i18n.config.dart';
import 'package:flutter_bootstrap/app/shared/widgets/buttons/widget.button.flat.default.dart';
import 'package:flutter_bootstrap/app/shared/widgets/buttons/widget.button.outline.default.dart';
import 'package:flutter_bootstrap/app/shared/widgets/logos/widget.logo.default.dart';

class AuthLoginWidgetBlockLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          WidgetLogoDefault(),
          SizedBox(
            height: 20.0,
          ),
          AuthLoginWidgetBlockForm(),
          SizedBox(
            height: 40.0,
          ),
          WidgetButtonFlatDefault(
            text: i18nDefault.authLoginForgotPassword.i18n,
            onPressed: () {
              Navigator.pushNamed(context, '/recovery');
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          WidgetButtonOutlineDefault(
            text: i18nDefault.authLoginSignUp.i18n,
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
          ),
        ],
      ),
    );
  }
}