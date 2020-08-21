import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.controller.dart';
import 'home.page.dart';

class HomeModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<HomeController>(create: (_) => HomeController()),
      ],
      child: HomePage(),
    );
  }
}
