import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:murieta/custom_widgets/app_button.widget.dart';
import 'package:murieta/custom_widgets/app_input.dart';
import 'package:murieta/pages/auth/login/login.controller.dart';
import 'package:murieta/pages/auth/signup/signup_page.dart';
import 'package:murieta/themes/app_colors.dart';
import 'package:murieta/themes/app_icon.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = new LoginController();
  var _formKey = GlobalKey<FormState>();
  FocusNode password = FocusNode();


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
                          nextFocus: password,
                          hintText: "E-mail", 
                          value: loginController.login.email,
                          onChange: (value) => loginController.login.email = value,
                          suffixIcon: AppIcons.email,),
                        ),
                        SizedBox(height: 16),
                        Observer(builder: (_) => AppInput(
                          focusNode: password,
                          hintText: "Senha",
                          value: loginController.login.password,
                          onChange: (value) => loginController.login.password = value,
                          obscureText: loginController.passwordHidden,
                          suffixIcon: loginController.passwordIcon,
                          suffixFunction: () => loginController.changeShowPassword(context: context)),
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Esqueceu a senha?"),
                          ],
                        )
                      ],
                    ),
                    AppButton(text: "Login", onPressed: (){
                      print(loginController.login.email);
                      print(loginController.login.password);
                    }),
                    Text(
                      "Cadastrar-se",
                      style: TextStyle(
                        color: AppColors.secondary,
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
