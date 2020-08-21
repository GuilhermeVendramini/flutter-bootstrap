import 'package:i18n_extension/i18n_extension.dart';

import './locales/en-US.dart' as enUS;
import './locales/pt-BR.dart' as ptBR;
import 'i18n.translate.dart';

final I18nTranslate _i18nEnUS = enUS.I18nStrings();
final I18nTranslate _i18nPtBR = ptBR.I18nStrings();
final I18nTranslate i18nDefault = _i18nEnUS;

extension Localization on String {
  static var t = Translations("en_us") +
      {
        "en_us": _i18nEnUS.appName,
        "pt_br": _i18nPtBR.appName,
      } +
      {
        "en_us": _i18nEnUS.home,
        "pt_br": _i18nPtBR.home,
      } +
      {
        "en_us": _i18nEnUS.validatorIsNotEmpty,
        "pt_br": _i18nPtBR.validatorIsNotEmpty,
      } +
      {
        "en_us": _i18nEnUS.validatorMinLength,
        "pt_br": _i18nPtBR.validatorMinLength,
      } +
      {
        "en_us": _i18nEnUS.validatorPasswordNotConfirm,
        "pt_br": _i18nPtBR.validatorPasswordNotConfirm,
      } +
      {
        "en_us": _i18nEnUS.validatorEmail,
        "pt_br": _i18nPtBR.validatorEmail,
      } +
      {
        "en_us": _i18nEnUS.login,
        "pt_br": _i18nPtBR.login,
      } +
      {
        "en_us": _i18nEnUS.register,
        "pt_br": _i18nPtBR.register,
      } +
      {
        "en_us": _i18nEnUS.email,
        "pt_br": _i18nPtBR.email,
      } +
      {
        "en_us": _i18nEnUS.password,
        "pt_br": _i18nPtBR.password,
      } +
      {
        "en_us": _i18nEnUS.authLoginForgotPassword,
        "pt_br": _i18nPtBR.authLoginForgotPassword,
      } +
      {
        "en_us": _i18nEnUS.authLoginSignUp,
        "pt_br": _i18nPtBR.authLoginSignUp,
      } +
      {
        "en_us": _i18nEnUS.name,
        "pt_br": _i18nPtBR.name,
      } +
      {
        "en_us": _i18nEnUS.authRegisterConfirmPassword,
        "pt_br": _i18nPtBR.authRegisterConfirmPassword,
      } +
      {
        "en_us": _i18nEnUS.authRegisterNewAccount,
        "pt_br": _i18nPtBR.authRegisterNewAccount,
      } +
      {
        "en_us": _i18nEnUS.recovery,
        "pt_br": _i18nPtBR.recovery,
      } +
      {
        "en_us": _i18nEnUS.submit,
        "pt_br": _i18nPtBR.submit,
      } +
      {
        "en_us": _i18nEnUS.authRecoveryPasswordSentEmailMessage,
        "pt_br": _i18nPtBR.authRecoveryPasswordSentEmailMessage,
      } +
      {
        "en_us": _i18nEnUS.authRegisterPasswordConfirmHelperText,
        "pt_br": _i18nPtBR.authRegisterPasswordConfirmHelperText,
      } +
      {
        "en_us": _i18nEnUS.authRegisterPasswordHelperText,
        "pt_br": _i18nPtBR.authRegisterPasswordHelperText,
      } +
      {
        "en_us": _i18nEnUS.welcomeMessage,
        "pt_br": _i18nPtBR.welcomeMessage,
      } +
      {
        "en_us": _i18nEnUS.coreNotFoundPage,
        "pt_br": _i18nPtBR.coreNotFoundPage,
      } +
      {
        "en_us": _i18nEnUS.coreNotFoundMessage,
        "pt_br": _i18nPtBR.coreNotFoundMessage,
      } +
      {
        "en_us": _i18nEnUS.authLoginErrorMessage,
        "pt_br": _i18nPtBR.authLoginErrorMessage,
      };

  String get i18n => localize(this, t);
}
