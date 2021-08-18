import 'package:aluguei/login.dart';
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
        splash: 'assets/images/logo_white.png',
        duration: 800,
        nextScreen: LoginPage(title: 'Login'),
        splashTransition: SplashTransition.rotationTransition,
        backgroundColor: Colors.blue,
      ),
    );
  }
}

