class RepositoryMockUsersInstance {
  RepositoryMockUsersInstance._();

  static final _RepositoryMockUsers repository = _RepositoryMockUsers();
}

class _RepositoryMockUsers {
  Future<Map<dynamic, dynamic>> getCurrentUser() async {
    return {'id': 1, 'name': 'admin', 'email': 'admin@admin.com'};
  }
}
