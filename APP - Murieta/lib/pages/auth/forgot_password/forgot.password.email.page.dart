import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:murieta/custom_widgets/app_button.widget.dart';
import 'package:murieta/custom_widgets/app_input.dart';
import 'package:murieta/pages/auth/forgot_password/forgot.password.code.page.dart';
import 'package:murieta/pages/auth/forgot_password/forgot.password.controller.dart';
import 'package:murieta/pages/auth/login/login.page.dart';
import 'package:murieta/pages/auth/signup/signup.page.dart';
import 'package:murieta/themes/app_colors.dart';
import 'package:murieta/themes/app_icon.dart';

class ForgotPasswordEmailPage extends StatefulWidget {
  @override
  _ForgotPasswordEmailPageState createState() => _ForgotPasswordEmailPageState();
}

class _ForgotPasswordEmailPageState extends State<ForgotPasswordEmailPage> {
  final forgotPasswordController = new ForgotPasswordController();
  var _formKey = GlobalKey<FormState>();

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
                        AppInput(
                          hintText: "E-mail",
                          value: forgotPasswordController.email,
                          onChange: (value) => forgotPasswordController.email = value,
                          suffixIcon: AppIcons.email,
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: size.width * 0.8,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text("Um código será enviado para o e-mail cadastrado",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 14
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    AppButton(text: "Enviar", onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ForgotPasswordCodePage()))),
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
