import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/app/core/themes/colors/core.theme.color.default.dart';

class WidgetButtonRaisedDefault extends StatelessWidget {
  final String text;
  final double buttonWidth;
  final Color buttonColor;
  final Color textColor;
  final Color splashColor;
  final Function onPressed;

  WidgetButtonRaisedDefault({
    @required this.text,
    @required this.onPressed,
    this.buttonWidth = 150.0,
    this.buttonColor = CoreThemeColorDefault.identityColor,
    this.textColor = CoreThemeColorDefault.white,
    this.splashColor = CoreThemeColorDefault.splashColor,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: buttonColor,
      onPressed: onPressed,
      splashColor: splashColor,
      child: SizedBox(
        width: buttonWidth,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
