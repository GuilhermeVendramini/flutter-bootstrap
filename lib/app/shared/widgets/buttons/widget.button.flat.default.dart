import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/app/core/themes/colors/core.theme.color.default.dart';

class WidgetButtonFlatDefault extends StatelessWidget {
  final String text;
  final double buttonWidth;
  final Color textColor;
  final Color splashColor;
  final Function onPressed;

  WidgetButtonFlatDefault({
    @required this.text,
    @required this.onPressed,
    this.buttonWidth = 150.0,
    this.textColor = CoreThemeColorDefault.identityColor,
    this.splashColor = CoreThemeColorDefault.splashColor,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      splashColor: splashColor,
      child: SizedBox(
        width: buttonWidth,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}