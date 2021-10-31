import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:murieta/themes/app_icon.dart';

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
  Icon passwordIcon = AppIcons.visibilityOn;
  
  @action
  setLoading(bool value) => isLoading = value;

  @action
  _setErrorMessage(String value) => errorMessage = value;

  @action
  changeShowPassword({required BuildContext context}){
    passwordHidden = !passwordHidden;
    if (passwordHidden) {
      passwordIcon = AppIcons.visibilityOff;
    } else {
      passwordIcon = AppIcons.visibilityOn;
    }

    FocusManager.instance.primaryFocus!.unfocus();
  }

}