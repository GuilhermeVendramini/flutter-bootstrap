import 'package:flutter_bootstrap/app/shared/models/user/model.user.dart';
import 'package:flutter_bootstrap/app/shared/services/users/service.users.dart';
import 'package:flutter_bootstrap/app/shared/utils/i18n/i18n.config.dart';
import 'package:mobx/mobx.dart';

part 'core.controller.g.dart';

enum UserLoadStatus { IDLE, LOADING, ERROR, DONE }

class CoreController = _CoreBase with _$CoreController;

abstract class _CoreBase with Store {
  final _serviceUser = ServiceUsers();

  @observable
  ModelUser currentUser;

  @observable
  UserLoadStatus userLoadStatus = UserLoadStatus.IDLE;

  @observable
  String messageStatus = '';

  @action
  Future<Null> loadCurrentUser() async {
    if (currentUser == null) {
      try {
        userLoadStatus = UserLoadStatus.LOADING;
        currentUser = await _serviceUser.loadCurrentUser();
        userLoadStatus = UserLoadStatus.DONE;
      } catch (e) {
        messageStatus = i18nDefault.currentUserErrorMessage.i18n;
        userLoadStatus = UserLoadStatus.ERROR;
      }
    }
    return;
  }

  @action
  Future<Null> logoutCurrentUser() async {
    if (currentUser != null) {
      try {
        await _serviceUser.logoutUser();
        currentUser = null;
      } catch (e) {
        throw e;
      }
    }
    return;
  }
}
