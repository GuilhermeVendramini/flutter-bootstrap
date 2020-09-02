import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/app/shared/utils/i18n/i18n.config.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core.controller.dart';

class CoreWidgetPageSplash extends StatefulWidget {
  final CoreController _coreController;

  CoreWidgetPageSplash(this._coreController);

  @override
  _CoreWidgetPageSplashState createState() => _CoreWidgetPageSplashState();
}

class _CoreWidgetPageSplashState extends State<CoreWidgetPageSplash> {
  CoreController get _coreController {
    return widget._coreController;
  }

  @override
  void initState() {
    _coreController.loadCurrentUser().then((_) {
      if (_coreController.currentUser != null) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('CoreWidgetPageSplash'),
      appBar: AppBar(
        title: Text(i18nDefault.appName.i18n),
      ),
      body: Center(
        child: Observer(
          builder: (_) {
            switch (_coreController.userLoadStatus) {
              case UserLoadStatus.ERROR:
                return Text(_coreController.messageStatus);
                break;
              case UserLoadStatus.LOADING:
                return CircularProgressIndicator();
                break;
              case UserLoadStatus.DONE:
              case UserLoadStatus.IDLE:
              default:
                return Text(i18nDefault.appName.i18n);
                break;
            }
          },
        ),
      ),
    );
  }
}
