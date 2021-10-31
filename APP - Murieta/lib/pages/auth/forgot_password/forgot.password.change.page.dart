import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:murieta/custom_widgets/app_button.widget.dart';
import 'package:murieta/custom_widgets/app_input.dart';
import 'package:murieta/pages/auth/forgot_password/forgot.password.controller.dart';
import 'package:murieta/pages/auth/login/login.page.dart';
import 'package:murieta/pages/auth/signup/signup.page.dart';
import 'package:murieta/themes/app_colors.dart';
import 'package:murieta/themes/app_icon.dart';

class ForgotPasswordChangePage extends StatefulWidget {
  @override
  _ForgotPasswordChangePageState createState() => _ForgotPasswordChangePageState();
}

class _ForgotPasswordChangePageState extends State<ForgotPasswordChangePage> {
  final forgotPasswordController = new ForgotPasswordController();
  var _formKey = GlobalKey<FormState>();
  FocusNode passwordConfirm = FocusNode();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          child: Column(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      AppIcons.logo.icon,
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
              Container(
                height: size.height * 0.55,
                width: size.width,
                padding: EdgeInsets.only(bottom: 16, left: 16, right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Observer(builder: (_) => AppInput(
                          nextFocus: passwordConfirm,
                          hintText: "Nova Senha",
                          value: forgotPasswordController.changePassword.password,
                          onChange: (value) => forgotPasswordController.changePassword.password = value,
                          obscureText: forgotPasswordController.passwordHidden,
                          suffixIcon: forgotPasswordController.passwordIcon,
                          suffixFunction: () => forgotPasswordController.changeShowPassword(context: context)(context: context)),
                        ),
                        SizedBox(height: 16),
                        Observer(builder: (_) => AppInput(
                          focusNode: passwordConfirm,
                          hintText: "Confirmar Nova Senha",
                          value: forgotPasswordController.changePassword.confirmPassword,
                          onChange: (value) => forgotPasswordController.changePassword.confirmPassword = value,
                          obscureText: forgotPasswordController.passwordConfirmHidden,
                          suffixIcon: forgotPasswordController.passwordConfirmIcon,
                          suffixFunction: () => forgotPasswordController.changeShowPasswordConfirm(context: context)(context: context)),
                        ),
                      ],
                    ),
                    AppButton(text: "Confirmar", onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => LoginPage()))),
                    GestureDetector(
                      onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginPage())),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: AppColors.secondary,
                          fontSize: 18
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  @override
  void dispose() {
    super.dispose();
  }
}
