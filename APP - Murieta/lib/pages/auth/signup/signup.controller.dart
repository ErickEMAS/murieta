import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:murieta/model/auth/SignUp.dart';
import 'package:murieta/themes/app_icon.dart';

part 'signup.controller.g.dart';

class SignupController = _SignupControllerBase with _$SignupController;

abstract class _SignupControllerBase with Store {

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
  bool passwordConfirmHidden = true;

  @observable
  Icon passwordConfirmIcon = Icon(AppIcons.visibilityOff);

  @observable
  SignUp signUp = SignUp();
  
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
  changeShowPasswordConfirm({required BuildContext context}){
    passwordConfirmHidden = !passwordConfirmHidden;
    if (passwordConfirmHidden) {
      passwordConfirmIcon = Icon(AppIcons.visibilityOff);
    } else {
      passwordConfirmIcon = Icon(AppIcons.visibilityOn);
    }
  }

}