import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aluguei/constants.dart';
import 'package:aluguei/loginForm.dart';

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
            Padding(
              padding: const EdgeInsets.fromLTRB(CustomDimens.mediumSpacing,
                  0.0, CustomDimens.mediumSpacing, 0.0),
              child: Container(
                alignment: Alignment.center,
                child: Center(
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  CustomDimens.mediumSpacing,
                                  CustomDimens.mediumSpacing,
                                  CustomDimens.mediumSpacing,
                                  0.0),
                              child: Image.asset(
                                'assets/images/logo_aluguei.png',
                                height: CustomDimens.logoSize,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const LoginForm()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
