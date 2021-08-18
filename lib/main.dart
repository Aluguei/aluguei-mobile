import 'package:aluguei/login.dart';
import 'package:aluguei/constants.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
        splash: 'assets/images/logo_animation.gif',
        duration: DimenConstants.splashDuration,
        nextScreen: LoginPage(title: 'Login'),
        backgroundColor: ColorConstants.primaryColor,
        splashIconSize: DimenConstants.logoSize.toDouble(),
      ),
    );
  }
}