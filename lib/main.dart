import 'package:flutter/material.dart';
import 'package:murieta/Presentation/pages/splash/splash.dart';
import 'package:murieta/core/helpers/service_locator.dart';

import 'core/themes/theme.dart';

void main() {
  setupLocator();
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
