import 'package:flutter/foundation.dart';
import 'package:flutter_bootstrap/app/core/core.controller.dart';
import 'package:flutter_bootstrap/app/shared/models/user/model.user.dart';
import 'package:flutter_bootstrap/app/shared/services/users/service.users.dart';
import 'package:flutter_bootstrap/app/shared/utils/i18n/i18n.config.dart';
import 'package:flutter_bootstrap/app/shared/utils/validators/validator.default.dart';
import 'package:mobx/mobx.dart';

part 'auth.login.controller.g.dart';

enum SignInUserStatus { IDLE, LOADING, DONE, ERROR }

class AuthLoginController = _AuthLoginBase with _$AuthLoginController;

abstract class _AuthLoginBase with Store {
  CoreController coreController;

  _AuthLoginBase({@required this.coreController});

  ServiceUsers _serviceUsers = ServiceUsers();

  ModelUser currentUser;

  @observable
  SignInUserStatus signInUserStatus = SignInUserStatus.IDLE;

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String messageStatus = '';

  @action
  void onChangeEmail(String value) {
    email = value.trim();
  }

  @action
  void onChangePassword(String value) {
    password = value.trim();
  }

  @computed
  bool get emailPasswordValidated {
    if (ValidatorDefault.isEmail(email) == null &&
        ValidatorDefault.password(password) == null) return true;
    return false;
  }

  Future<ModelUser> loginWithEmailPassword() async {
    try {
      signInUserStatus = SignInUserStatus.LOADING;
      currentUser = await _serviceUsers.signInWithEmailPassword(
          email: email, password: password);

      if (currentUser == null) {
        messageStatus = i18nDefault.authLoginErrorMessage.i18n;
        signInUserStatus = SignInUserStatus.DONE;
        return null;
      }

      coreController.currentUser = currentUser;
      signInUserStatus = SignInUserStatus.DONE;
      return currentUser;
    } catch (e) {
      messageStatus = e.message;
      signInUserStatus = SignInUserStatus.ERROR;
      return null;
    }
  }
}
