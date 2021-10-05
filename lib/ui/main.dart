import 'package:aluguei/resources/constants.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'home/home.dart';
import 'loginScreen/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //TODO nextScreen verificar se ja existe um token de login salvo em cache, se ja existir manda direto pra home
      home: AnimatedSplashScreen(
        splash: 'assets/images/logo_animation.gif',
        duration: CustomDimens.splashDuration,
        nextScreen: LoginPage(title: 'Login'),
        backgroundColor: CustomColors.primaryColor,
        splashIconSize: CustomDimens.logoSize,
      ),
    );
  }
}

void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
