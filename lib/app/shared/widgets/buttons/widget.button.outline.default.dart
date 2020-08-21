import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/app/core/themes/colors/core.theme.color.default.dart';

class WidgetButtonOutlineDefault extends StatelessWidget {
  final String text;
  final double buttonWidth;
  final Color textColor;
  final Color splashColor;
  final Color highlightedBorderColor;
  final Function onPressed;

  WidgetButtonOutlineDefault({
    @required this.text,
    @required this.onPressed,
    this.buttonWidth = 150.0,
    this.textColor = CoreThemeColorDefault.identityColor,
    this.splashColor = CoreThemeColorDefault.splashColor,
    this.highlightedBorderColor = CoreThemeColorDefault.identityColor,
  });

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: onPressed,
      splashColor: splashColor,
      highlightedBorderColor: highlightedBorderColor,
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
