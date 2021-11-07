import 'package:flutter/material.dart';
import 'package:murieta/pages/Splash/splash.controller.dart';
import 'package:murieta/themes/app_colors.dart';
import 'package:murieta/themes/app_dimensions.dart';
import 'package:murieta/themes/app_icon.dart';

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  AppIcons.logo,
                  color: AppColors.primary,
                  size: 112,
                ),
                Text(
                  "Murieta",
                  style: TextStyle(
                    fontSize: 64
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
