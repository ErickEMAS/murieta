import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:murieta/Data/repositories/auth.repository.dart';
import 'package:murieta/Domain/model/auth/login.dart';
import 'package:murieta/Domain/model/response_model.dart';
import 'package:murieta/Domain/service/auth.service.dart';
import 'package:murieta/Presentation/pages/dashboard/dash.page.dart';
import 'package:murieta/core/helpers/service_locator.dart';
import 'package:murieta/core/themes/app_icon.dart';

part 'login.controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {

  @observable
  bool isLoading = false;

  @observable
  bool isLogged = false;

  @observable
  String errorMessage = "";

  @observable
  bool passwordHidden = true;

  @observable
  Icon passwordIcon = Icon(AppIcons.visibilityOff);

  @observable
  LoginDTO loginDTO = LoginDTO();
  
  @action
  setLoading(bool value) => isLoading = value;

  @action
  _setErrorMessage(String value) => errorMessage = value;

  @action
  changeShowPassword({required BuildContext context}){
    passwordHidden = !passwordHidden;
    if (passwordHidden) {
      passwordIcon = Icon(AppIcons.visibilityOff);
    } else {
      passwordIcon = Icon(AppIcons.visibilityOn);
    }
  }

  @action
  login({required BuildContext context}) async{
    AuthService _authService = serviceLocator<AuthService>();

    ResponseModel ret = await _authService.login(signInDto: loginDTO);

    if (ret.status == 200){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => DashboardPage()));
    }
  }

}