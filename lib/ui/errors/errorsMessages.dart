import 'package:aluguei/resources/strings.dart';
import 'package:flutter/material.dart';

class ErrorsMessages {

  static showGenericErrorMessage(context) {
    ScaffoldMessenger.of(context).
    showSnackBar(SnackBar(content: Text(Strings.genericErrorMessage)));
  }

  static showLoginErrorMessage(context) {
    ScaffoldMessenger.of(context).
    showSnackBar(SnackBar(content: Text(Strings.loginErrorMessage)));
  }
}