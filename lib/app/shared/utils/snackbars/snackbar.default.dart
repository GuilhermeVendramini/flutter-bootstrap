import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/app/core/themes/colors/core.theme.color.default.dart';

class SnackBarDefault {
  SnackBarDefault._();

  static buildSnackBar({
    @required BuildContext context,
    int seconds = 3,
    @required String content,
    Color backgroundColor = CoreThemeColorDefault.white,
    Color contentColor = CoreThemeColorDefault.identityColor,
  }) {
    return Scaffold.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: Text(
          content,
          style: TextStyle(
            color: contentColor,
          ),
        ),
        duration: Duration(seconds: seconds),
      ),
    );
  }
}
