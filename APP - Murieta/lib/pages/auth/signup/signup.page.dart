import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:murieta/custom_widgets/app_button.widget.dart';
import 'package:murieta/custom_widgets/app_input.dart';
import 'package:murieta/pages/auth/login/login.controller.dart';
import 'package:murieta/pages/auth/login/login.page.dart';
import 'package:murieta/pages/auth/signup/signup.controller.dart';
import 'package:murieta/pages/auth/signup/signup.page.dart';
import 'package:murieta/themes/app_colors.dart';
import 'package:murieta/themes/app_icon.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final signupController = SignupController();
  var _formKey = GlobalKey<FormState>();
  FocusNode email = FocusNode();
  FocusNode password = FocusNode();
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
                          nextFocus: email,
                          hintText: "Username", 
                          suffixIcon: AppIcons.person, 
                          value: signupController.signUp.username,
                          onChange: (value) => signupController.signUp.username = value),
                        ),
                        SizedBox(height: 16),
                        Observer(builder: (_) => AppInput(
                          focusNode: email,
                          nextFocus: password,
                          hintText: "E-mail", 
                          suffixIcon: AppIcons.email, 
                          value: signupController.signUp.email,
                          onChange: (value) => signupController.signUp.email = value),
                        ),
                        SizedBox(height: 16),
                        Observer(builder: (_) => AppInput(
                          focusNode: password,
                          nextFocus: passwordConfirm,
                          hintText: "Confirmar Senha",
                          value: signupController.signUp.password,
                          onChange: (value) => signupController.signUp.password = value,
                          obscureText: signupController.passwordHidden,
                          suffixIcon: signupController.passwordIcon,
                          suffixFunction: () => signupController.changeShowPassword(context: context)(context: context)),
                        ),
                        SizedBox(height: 16),
                        Observer(builder: (_) => AppInput(
                          focusNode: passwordConfirm,
                          hintText: "Confirmar Senha",
                          value: signupController.signUp.confirmPassword,
                          onChange: (value) => signupController.signUp.confirmPassword = value,
                          obscureText: signupController.passwordConfirmHidden,
                          suffixIcon: signupController.passwordConfirmIcon,
                          suffixFunction: () => signupController.changeShowPasswordConfirm(context: context)(context: context)),
                        ),
                      ],
                    ),
                    AppButton(text: "Cadastrar ", onPressed: (){
                    }),
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
