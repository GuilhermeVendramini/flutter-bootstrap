import 'package:mobx/mobx.dart';

part 'auth.recoveryPassword.controller.g.dart';

enum RecoveryPasswordStatus { IDLE, LOADING, DONE, ERROR }

class AuthRecoveryPasswordController = _AuthRecoveryPasswordBase with _$AuthRecoveryPasswordController;

abstract class _AuthRecoveryPasswordBase with Store {

}