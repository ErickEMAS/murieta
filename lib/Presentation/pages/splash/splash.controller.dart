import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:murieta/Data/source/local_storage.source.dart';
import 'package:murieta/Domain/model/auth/user.model.dart';
import 'package:murieta/Domain/service/auth.service.dart';
import 'package:murieta/Presentation/pages/auth/login/login.page.dart';
import 'package:murieta/Presentation/pages/dashboard/dash.page.dart';

part 'splash.controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  final _authService = AuthService();

  @observable
  bool isLoading = false;

  @action
  setLoading(bool value) => isLoading = value;

  @observable
  String errorMessage = "";

  @action
  _setErrorMessage(String value) => errorMessage = value;

  Future<void> init(BuildContext context) async {
    final storageMe = await LocalStorageSource.getString(LocalStorageKeys.me);
    print("Me: ${storageMe}");

    Timer(new Duration(seconds: 2), () {
      if (storageMe != "") {
        Map<String, dynamic> valueMap = json.decode(storageMe);
        UserModel usermodel = UserModel.fromJson(valueMap);

        _authService.setCurrentUser(usermodel);

        final eu = _authService.currentUser;

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => DashboardPage()));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
      }
    });
      
  }

}