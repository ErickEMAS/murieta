
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:murieta/Data/source/local_storage.source.dart';
import 'package:murieta/Presentation/pages/auth/login/login.page.dart';

part 'settings.controller.g.dart';

class SettingsController = _SettingsControllerBase with _$SettingsController;

abstract class _SettingsControllerBase with Store {
  
  @action
  void logout({required BuildContext context}){
    LocalStorageSource.setString(LocalStorageKeys.access_token, "");
    LocalStorageSource.setString(LocalStorageKeys.me, "");
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
  }
}