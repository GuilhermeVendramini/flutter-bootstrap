import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/app/shared/utils/i18n/i18n.config.dart';

class CoreWidgetPageNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(i18nDefault.coreNotFoundPage.i18n),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            i18nDefault.coreNotFoundMessage.i18n,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}