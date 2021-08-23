import 'package:flutter/cupertino.dart';
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
        backgroundColor: CustomColors.greyBackgroundColor,
        body: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  color: CustomColors.primaryColor,
                )
              ],
            ),
            Container(
              alignment: Alignment.center,
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                              color: CustomColors.textGrey,
                              height: CustomDimens.fieldHeight),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: CustomColors.fieldBorderColor)),
                              labelText: Strings.fieldEmailTitle,
                              labelStyle:
                                  TextStyle(color: CustomColors.textGrey),
                              fillColor: CustomColors.greyBackgroundColor,
                              filled: true),
                        )),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(
                            CustomDimens.mediumSpacing,
                            0.0,
                            CustomDimens.mediumSpacing,
                            CustomDimens.smallSpacing),
                        child: TextField(
                          obscureText: true,
                          autocorrect: false,
                          enableSuggestions: false,
                          style: TextStyle(
                            fontSize: CustomDimens.fieldFontSize,
                            color: CustomColors.textGrey,
                            height: CustomDimens.fieldHeight,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: CustomColors.fieldBorderColor),
                            ),
                            labelText: Strings.fieldPasswordTitle,
                            labelStyle: TextStyle(color: CustomColors.textGrey),
                            fillColor: CustomColors.greyBackgroundColor,
                            filled: true,
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
