import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/app/core/core.controller.dart';
import 'package:flutter_bootstrap/app/shared/widgets/logos/widget.logo.default.dart';
import 'package:provider/provider.dart';

class WidgetDefaultDrawer extends StatefulWidget {
  @override
  _WidgetDefaultDrawerState createState() => _WidgetDefaultDrawerState();
}

class _WidgetDefaultDrawerState extends State<WidgetDefaultDrawer> {
  CoreController _coreController;

  _logoutUser() async {
    await _coreController.logoutCurrentUser();
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    _coreController = Provider.of<CoreController>(context);
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            key: Key('WidgetDefaultDrawerHeader'),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                WidgetLogoDefault(
                  fontSize: 20.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                _coreController.currentUser?.name != null
                    ? Text(_coreController.currentUser.name)
                    : Container(),
              ],
            ),
          ),
          ListTile(
            key: Key('WidgetDefaultDrawer.home'),
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          ListTile(
            key: Key('WidgetDefaultDrawer.logout'),
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: _logoutUser,
          ),
        ],
      ),
    );
  }
}
