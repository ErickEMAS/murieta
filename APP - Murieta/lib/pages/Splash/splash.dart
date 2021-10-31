import 'package:flutter/material.dart';
import 'package:murieta/pages/Splash/splash.controller.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashController = new SplashController();
  
  @override
  void initState() {
    super.initState();
    splashController.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Image.asset(
              "assets/logo.png",
              width: MediaQuery.of(context).size.width / 2,
              fit: BoxFit.contain,),
          ),
        ),
      ),
    );
  }

}
