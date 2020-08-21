import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/app/shared/models/user/model.user.dart';
import 'package:flutter_bootstrap/app/shared/utils/i18n/i18n.config.dart';
import 'package:flutter_bootstrap/app/shared/utils/snackbars/snackbar.default.dart';
import 'package:flutter_bootstrap/app/shared/utils/validators/validator.default.dart';
import 'package:flutter_bootstrap/app/shared/widgets/buttons/widget.button.raised.default.dart';
import 'package:flutter_bootstrap/app/shared/widgets/formFields/widget.formField.password.default.dart';
import 'package:flutter_bootstrap/app/shared/widgets/formFields/widget.formField.text.default.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../auth.login.controller.dart';

class AuthLoginWidgetBlockForm extends StatefulWidget {
  @override
  _AuthLoginWidgetBlockFormState createState() =>
      _AuthLoginWidgetBlockFormState();
}

class _AuthLoginWidgetBlockFormState extends State<AuthLoginWidgetBlockForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthLoginController _authLoginController;

  void _formSubmit() async {
    final _form = _formKey.currentState;
    if (_form.validate()) {
      _form.save();
      ModelUser user = await _authLoginController.loginWithEmailPassword();
      if (user != null) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        if (_authLoginController.messageStatus.isNotEmpty) {
          SnackBarDefault.buildSnackBar(
            context: context,
            content: _authLoginController.messageStatus,
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _authLoginController = Provider.of<AuthLoginController>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          WidgetFormFieldTextDefault(
            textInputType: TextInputType.emailAddress,
            hintText: i18nDefault.email.i18n,
            icon: Icons.email,
            validator: ValidatorDefault.isEmail,
            onChanged: _authLoginController.onChangeEmail,
          ),
          WidgetFormFieldPasswordDefault(
            hintText: i18nDefault.password.i18n,
            icon: Icons.lock,
            validator: ValidatorDefault.password,
            onChanged: _authLoginController.onChangePassword,
          ),
          SizedBox(
            height: 10.0,
          ),
          Observer(builder: (_) {
            if (_authLoginController.signInUserStatus ==
                SignInUserStatus.LOADING) {
              return CircularProgressIndicator();
            } else {
              return WidgetButtonRaisedDefault(
                text: i18nDefault.login.i18n,
                onPressed: _authLoginController.emailPasswordValidated
                    ? _formSubmit
                    : null,
              );
            }
          }),
        ],
      ),
    );
  }
}
