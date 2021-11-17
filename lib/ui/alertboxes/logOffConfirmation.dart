import 'package:aluguei/repository/models/authentication/loginResponse.dart';
import 'package:aluguei/ui/home/home.dart';
import 'package:aluguei/ui/loginScreen/login.dart';
import 'package:flutter/material.dart';
import 'package:aluguei/resources/strings.dart';
import 'package:hive/hive.dart';

showAlertDialog(BuildContext context) {

  Future<void> cleanCache() async {
    final box = await Hive.openBox<LoginResponse>('loginResponse');
    box.deleteFromDisk();

  }

  void logoutUser() {
    cleanCache();

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (BuildContext context) => LoginPage(title: "login"),
      ),
      (Route route) => false,
    );
  }

  Widget cancelButton = FlatButton(
    child: Text(Strings.AlertNoConfirmation),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  Widget continueButton = FlatButton(
    child: Text(Strings.AlertYesConfirmation),
    onPressed: () {
      logoutUser();
    },
  );

  AlertDialog alert = AlertDialog(
    content: Text("Deseja realmente sair do aplicativo?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
