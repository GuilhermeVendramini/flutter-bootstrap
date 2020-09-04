import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core.controller.dart';
import 'core.widget.dart';

class CoreModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      key: Key('CoreModule'),
      providers: [
        Provider<CoreController>(create: (_) => CoreController()),
      ],
      child: CoreWidget(),
    );
  }
}