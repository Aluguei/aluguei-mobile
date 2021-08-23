import 'package:flutter/material.dart';
import 'package:aluguei/constants.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: Center(
        child: Image.asset(
          'assets/images/logo_aluguei.png',
          height: DimenConstants.logoSize.toDouble(),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
