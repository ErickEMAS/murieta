import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:murieta/pages/login_page.dart';
import 'package:murieta/themes/app_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigo,
      ),
      home: AnimatedSplashScreen(
        duration: 2000,
        splash: Image.asset("assets/logo.png"),
        nextScreen: LoginPage(),
        backgroundColor: AppColors.primary,
        splashTransition: SplashTransition.fadeTransition,
        ),
    );
  }
}
