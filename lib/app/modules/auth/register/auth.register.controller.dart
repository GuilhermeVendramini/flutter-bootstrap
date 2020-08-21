import 'package:flutter/foundation.dart';
import 'package:flutter_bootstrap/app/core/core.controller.dart';
import 'package:mobx/mobx.dart';

part 'auth.register.controller.g.dart';

enum RegisterUserStatus { IDLE, LOADING, DONE, ERROR }

class AuthRegisterController = _AuthRegisterBase with _$AuthRegisterController;

abstract class _AuthRegisterBase with Store {
  CoreController coreController;

  _AuthRegisterBase({@required this.coreController});
}
