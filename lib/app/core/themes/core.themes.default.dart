import 'package:flutter/material.dart';

import 'colors/core.theme.color.default.dart';

class CoreThemesDefault {
  CoreThemesDefault._();

  static ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: CoreThemeColorDefault.primaryColor,
    accentColor: CoreThemeColorDefault.accentColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: CoreThemeColorDefault.identityColor,
    ),
    iconTheme: IconThemeData(
      color: CoreThemeColorDefault.iconsColor,
    ),
    primaryIconTheme: IconThemeData(
      color: CoreThemeColorDefault.iconsColor,
    ),
  );
}
