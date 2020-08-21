import 'package:flutter/foundation.dart';

class ModelUser {
  final String id;
  final String name;
  final String email;

  ModelUser({
    @required this.id,
    @required this.name,
    this.email,
  });

  factory ModelUser.fromMap(Map<dynamic, dynamic> data) {
    return ModelUser(
      id: data['id'].toString(),
      name: data['name'].toString(),
      email: data['email'].toString(),
    );
  }
}