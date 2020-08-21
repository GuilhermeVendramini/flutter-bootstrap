// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CoreController on _CoreBase, Store {
  final _$currentUserAtom = Atom(name: '_CoreBase.currentUser');

  @override
  ModelUser get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(ModelUser value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  final _$userLoadStatusAtom = Atom(name: '_CoreBase.userLoadStatus');

  @override
  UserLoadStatus get userLoadStatus {
    _$userLoadStatusAtom.reportRead();
    return super.userLoadStatus;
  }

  @override
  set userLoadStatus(UserLoadStatus value) {
    _$userLoadStatusAtom.reportWrite(value, super.userLoadStatus, () {
      super.userLoadStatus = value;
    });
  }

  final _$messageStatusAtom = Atom(name: '_CoreBase.messageStatus');

  @override
  String get messageStatus {
    _$messageStatusAtom.reportRead();
    return super.messageStatus;
  }

  @override
  set messageStatus(String value) {
    _$messageStatusAtom.reportWrite(value, super.messageStatus, () {
      super.messageStatus = value;
    });
  }

  final _$loadCurrentUserAsyncAction = AsyncAction('_CoreBase.loadCurrentUser');

  @override
  Future<Null> loadCurrentUser() {
    return _$loadCurrentUserAsyncAction.run(() => super.loadCurrentUser());
  }

  final _$logoutCurrentUserAsyncAction =
      AsyncAction('_CoreBase.logoutCurrentUser');

  @override
  Future<Null> logoutCurrentUser() {
    return _$logoutCurrentUserAsyncAction.run(() => super.logoutCurrentUser());
  }

  @override
  String toString() {
    return '''
currentUser: ${currentUser},
userLoadStatus: ${userLoadStatus},
messageStatus: ${messageStatus}
    ''';
  }
}
