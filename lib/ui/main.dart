import 'dart:io';

import 'package:aluguei/repository/models/authentication/loginResponse.dart';
import 'package:aluguei/resources/constants.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'home/home.dart';
import 'loginScreen/login.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

Future<bool> haveAccessToken() async {
  final box = await Hive.openBox<LoginResponse>('loginResponse');
  final LoginResponse? loginResponseCache = box.isNotEmpty? box.getAt(0) : null;
  if (loginResponseCache != null) {
    return true;
  } else {
    return false;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(LoginResponseAdapter());

  StatefulWidget nextScreen = HomePage(title: 'Home');
  final hasAccessToken = await haveAccessToken();
  if(hasAccessToken) {
    nextScreen = HomePage(title: 'Home');
  } else {
    nextScreen = LoginPage(title: 'Login');
  }

  runApp(MyApp(nextScreen));
}

class MyApp extends StatelessWidget {
  const MyApp(this.nextScreen);

  final StatefulWidget nextScreen;

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
        nextScreen: nextScreen,
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
