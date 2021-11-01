import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:murieta/pages/auth/dashboard/dash.page.dart';
import 'package:murieta/pages/auth/login/login.page.dart';

part 'splash.controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {

  @observable
  bool isLoading = false;

  @action
  setLoading(bool value) => isLoading = value;

  @observable
  bool isLogged = false;

  @observable
  String errorMessage = "";

  @action
  _setErrorMessage(String value) => errorMessage = value;

  Future<void> init(BuildContext context) async {
    autoLogin();
    Timer(new Duration(seconds: 2), () {
      if (isLogged) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => DashboardPage()));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
      }
    });
      
  }

  Future<void> autoLogin() async {
    print("AutoLogin Aqui!");
  }

}