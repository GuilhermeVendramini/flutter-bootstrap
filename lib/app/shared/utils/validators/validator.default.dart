import 'package:flutter_bootstrap/app/shared/utils/i18n/i18n.config.dart';

class ValidatorDefault {
  ValidatorDefault._();

  static String isNotEmpty(String value) {
    if (value.isEmpty) {
      return i18nDefault.validatorIsNotEmpty.i18n;
    }

    return null;
  }

  static String isEmail(String value) {
    String valueValidate = isNotEmpty(value);

    if (valueValidate != null) {
      return valueValidate;
    }

    if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value) ==
        false) {
      return i18nDefault.validatorEmail.i18n;
    }

    return null;
  }

  static String password(String value) {
    String valueValidate = isNotEmpty(value);

    if (valueValidate != null) {
      return valueValidate;
    }

    if (value.length < 8) {
      return i18nDefault.validatorMinLength.i18n;
    }

    return null;
  }

  static String confirmPassword(String value, String firstValue) {
    String passwordValidate = password(value);

    if (passwordValidate != null) {
      return passwordValidate;
    }

    if (value != firstValue) {
      return i18nDefault.validatorPasswordNotConfirm.i18n;
    }

    return null;
  }
}