import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/app/shared/utils/i18n/i18n.config.dart';
import 'package:flutter_bootstrap/app/shared/widgets/drawers/widget.drawer.default.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(i18nDefault.home.i18n),
      ),
      drawer: WidgetDefaultDrawer(),
      body: Center(
        child: Text(i18nDefault.welcomeMessage.i18n),
      ),
    );
  }
}