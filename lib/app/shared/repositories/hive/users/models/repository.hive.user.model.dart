import 'package:flutter/foundation.dart';
import 'package:flutter_bootstrap/app/shared/models/user/model.user.dart';
import 'package:hive/hive.dart';

part 'repository.hive.user.model.g.dart';

@HiveType(typeId: 0)
class HiveUserModel implements ModelUser {
  @HiveField(0)
  String id;

  @HiveField(1)
  String email;

  @HiveField(2)
  String name;

  HiveUserModel({
    @required this.id,
    @required this.name,
    @required this.email,
  });
}