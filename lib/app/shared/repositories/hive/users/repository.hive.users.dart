import 'package:flutter/foundation.dart';
import 'package:flutter_bootstrap/app/shared/models/user/model.user.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'models/repository.hive.user.model.dart';

class RepositoryHiveUsersInstance {
  RepositoryHiveUsersInstance._();

  static final _HiveUserRepository repository = _HiveUserRepository();
}

class _HiveUserRepository {
  Box<HiveUserModel> _currentUserBox;

  Future<Null> _loadCurrentUserBox() async {
    try {
      if (_currentUserBox == null) {
        try {
          var dir = await getApplicationDocumentsDirectory();
          Hive.init(dir.path);
          Hive.registerAdapter(HiveUserModelAdapter());
          _currentUserBox = await Hive.openBox<HiveUserModel>('currentUserBox');
        } catch (e) {
          throw e;
        }
      }
      return;
    } catch (e) {
      throw e;
    }
  }

  Future<void> saveCurrentUser({@required ModelUser user}) async {
    try {
      await _loadCurrentUserBox();
      _currentUserBox.put(
        'currentUser',
        HiveUserModel(
          id: user.id,
          name: user.name,
          email: user.email,
        ),
      );
    } catch (e) {
      throw e;
    }
  }

  Future<void> deleteCurrentUser() async {
    try {
      await _loadCurrentUserBox();
      _currentUserBox.delete('currentUser');
    } catch (e) {
      throw e;
    }
  }

  Future<ModelUser> getCurrentUser() async {
    try {
      await _loadCurrentUserBox();
      if (_currentUserBox.isNotEmpty) {
        ModelUser currentUser = _currentUserBox.get('currentUser');
        return currentUser;
      }
      return null;
    } catch (e) {
      throw e;
    }
  }
}
