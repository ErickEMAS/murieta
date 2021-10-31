import 'package:flutter/material.dart';
import 'package:murieta/pages/Splash/splash.dart';
import 'package:murieta/pages/auth/login/login.page.dart';
import 'package:murieta/themes/app_colors.dart';
import 'package:murieta/themes/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: DarkMode(),
      home: SplashScreen(),
    );
  }
}
