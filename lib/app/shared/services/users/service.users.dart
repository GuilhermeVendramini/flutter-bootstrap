import 'package:flutter_bootstrap/app/shared/models/user/model.user.dart';
import 'package:flutter_bootstrap/app/shared/repositories/hive/users/repository.hive.users.dart';
import 'package:flutter_bootstrap/app/shared/repositories/mock/repository.mock.users.dart';

class ServiceUsers {
  final _repositoryMockUsers = RepositoryMockUsersInstance.repository;
  final _repositoryHiveUsers = RepositoryHiveUsersInstance.repository;

  Future<ModelUser> loadCurrentUser() async {
    try {
      ModelUser _currentUser = await _repositoryHiveUsers.getCurrentUser();

      if (_currentUser != null) return _currentUser;

      Map<dynamic, dynamic> _result =
          await _repositoryMockUsers.getCurrentUser();

      if (_result == null) return null;

      _currentUser = ModelUser.fromMap(_result);
      _repositoryHiveUsers.saveCurrentUser(user: _currentUser);
      return _currentUser;
    } catch (e) {
      throw e;
    }
  }

  Future<ModelUser> signInWithEmailPassword(
      {String email, String password}) async {
    try {
      if (email != 'admin@admin.com' && password != '12345678') return null;

      return await loadCurrentUser();
    } catch (e) {
      throw e;
    }
  }

  Future<void> logoutUser() async {
    await _repositoryHiveUsers.deleteCurrentUser();
  }
}
