import 'package:flutter/material.dart';
import 'package:aluguei/constants.dart';
import 'package:aluguei/strings.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/logo_aluguei.png',
              height: CustomDimens.logoSize,
              fit: BoxFit.cover,
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(
                    CustomDimens.mediumSpacing,
                    CustomDimens.smallSpacing,
                    CustomDimens.mediumSpacing,
                    CustomDimens.smallSpacing),
                child: TextField(
                  style: TextStyle(
                      fontSize: CustomDimens.fieldFontSize,
                      color: CustomColors.textGrey),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: Strings.fieldEmailTitle,
                      fillColor: CustomColors.fieldBackgroundColor,
                      filled: true),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(CustomDimens.mediumSpacing,
                    0.0, CustomDimens.mediumSpacing, CustomDimens.smallSpacing),
                child: TextField(
                  style: TextStyle(
                      fontSize: CustomDimens.fieldFontSize,
                      color: CustomColors.textGrey),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: Strings.fieldPasswordTitle,
                    fillColor: CustomColors.fieldBackgroundColor,
                    filled: true,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
