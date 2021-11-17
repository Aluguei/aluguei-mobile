import 'package:aluguei/ui/home/home.dart';
import 'package:flutter/material.dart';
import 'package:aluguei/resources/strings.dart';

showAlertDialog(BuildContext context) {



  Widget cancelButton = FlatButton(
    child: Text(Strings.AlertNoConfirmation),
    onPressed: () {
      Navigator.of(context).pop();







    },
  );
  Widget continueButton = FlatButton(
    child: Text(Strings.AlertYesConfirmation),
    onPressed: () {
      //TODO COLOCAR AQUI O LOGOUT
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