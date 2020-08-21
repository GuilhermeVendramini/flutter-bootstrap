import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/app/core/themes/colors/core.theme.color.default.dart';

class WidgetLogoDefault extends StatelessWidget {
  final double fontSize;

  WidgetLogoDefault({this.fontSize = 28.0});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        color: CoreThemeColorDefault.identityColor,
        padding: EdgeInsets.all(10.0),
        child: Text(
          'Flutter Bootstrap',
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            color: CoreThemeColorDefault.white,
          ),
        ),
      ),
    );
  }
}
