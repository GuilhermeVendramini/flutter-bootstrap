import '../i18n.translate.dart';

class I18nStrings implements I18nTranslate {
  String appName = 'Flutter Bootstrap';
  String home = 'Home';
  String validatorEmail = 'Invalid email';
  String validatorIsNotEmpty = 'Can\'t be empty';
  String validatorMinLength = 'Can\'t be less than 8 characters';
  String validatorPasswordNotConfirm = 'Password don\'t match';
  String login = 'Login';
  String register = 'Register';
  String email = 'Email';
  String password = 'Password';
  String authLoginForgotPassword = 'Forgot your password?';
  String authLoginSignUp = 'Sign Up';
  String name = 'Name';
  String authRegisterConfirmPassword = 'Confirm password';
  String authRegisterNewAccount = 'Create new account';
  String recovery = 'Recovery';
  String submit = 'Submit';
  String authRecoveryPasswordSentEmailMessage =
      'Password sent! Please check your mailbox.';
  String authRegisterPasswordHelperText = 'At least 8 characters';
  String authRegisterPasswordConfirmHelperText = 'Passwords must match';
  String welcomeMessage = 'Welcome to Flutter Bootstrap';
  String coreNotFoundPage = 'Page not found';
  String coreNotFoundMessage =
      'Page not found or you don\'t have the necessary credentials.';
  String authLoginErrorMessage = 'Username or password is invalid';
}
