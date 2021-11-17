import 'package:aluguei/resources/constants.dart';
import 'package:aluguei/resources/strings.dart';
import 'package:flutter/material.dart';

class ErrorsMessages {

  static showGenericErrorMessage(context) {
    ScaffoldMessenger.of(context).
    showSnackBar(SnackBar(content: Text(Strings.genericErrorMessage),behavior: SnackBarBehavior.floating,backgroundColor: CustomColors.darkPrimaryColor));
  }

  static showLoginErrorMessage(context) {
    ScaffoldMessenger.of(context).
    showSnackBar(SnackBar(content: Text(Strings.loginErrorMessage),behavior: SnackBarBehavior.floating,backgroundColor: CustomColors.darkPrimaryColor));
  }

  static showRegistrationErrorMessage(context) {
    ScaffoldMessenger.of(context).
    showSnackBar(SnackBar(content: Text(Strings.registerErrorMessage),behavior: SnackBarBehavior.floating,backgroundColor: CustomColors.darkPrimaryColor));
  }

  static showResetPasswordErrorMessage(context) {
    ScaffoldMessenger.of(context).
    showSnackBar(SnackBar(content: Text(Strings.resetPasswordErrorMessage),behavior: SnackBarBehavior.floating,backgroundColor: CustomColors.darkPrimaryColor));
  }
}