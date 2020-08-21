// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.login.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthLoginController on _AuthLoginBase, Store {
  Computed<bool> _$emailPasswordValidatedComputed;

  @override
  bool get emailPasswordValidated => (_$emailPasswordValidatedComputed ??=
          Computed<bool>(() => super.emailPasswordValidated,
              name: '_AuthLoginBase.emailPasswordValidated'))
      .value;

  final _$signInUserStatusAtom = Atom(name: '_AuthLoginBase.signInUserStatus');

  @override
  SignInUserStatus get signInUserStatus {
    _$signInUserStatusAtom.reportRead();
    return super.signInUserStatus;
  }

  @override
  set signInUserStatus(SignInUserStatus value) {
    _$signInUserStatusAtom.reportWrite(value, super.signInUserStatus, () {
      super.signInUserStatus = value;
    });
  }

  final _$emailAtom = Atom(name: '_AuthLoginBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_AuthLoginBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$messageStatusAtom = Atom(name: '_AuthLoginBase.messageStatus');

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

  final _$_AuthLoginBaseActionController =
      ActionController(name: '_AuthLoginBase');

  @override
  void onChangeEmail(String value) {
    final _$actionInfo = _$_AuthLoginBaseActionController.startAction(
        name: '_AuthLoginBase.onChangeEmail');
    try {
      return super.onChangeEmail(value);
    } finally {
      _$_AuthLoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onChangePassword(String value) {
    final _$actionInfo = _$_AuthLoginBaseActionController.startAction(
        name: '_AuthLoginBase.onChangePassword');
    try {
      return super.onChangePassword(value);
    } finally {
      _$_AuthLoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
signInUserStatus: ${signInUserStatus},
email: ${email},
password: ${password},
messageStatus: ${messageStatus},
emailPasswordValidated: ${emailPasswordValidated}
    ''';
  }
}
