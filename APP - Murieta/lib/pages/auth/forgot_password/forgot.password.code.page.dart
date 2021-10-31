import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:murieta/custom_widgets/app_button.widget.dart';
import 'package:murieta/custom_widgets/app_input.dart';
import 'package:murieta/pages/auth/forgot_password/forgot.password.change.page.dart';
import 'package:murieta/pages/auth/forgot_password/forgot.password.controller.dart';
import 'package:murieta/pages/auth/login/login.page.dart';
import 'package:murieta/pages/auth/signup/signup.page.dart';
import 'package:murieta/themes/app_colors.dart';
import 'package:murieta/themes/app_icon.dart';

class ForgotPasswordCodePage extends StatefulWidget {
  @override
  _ForgotPasswordCodePageState createState() => _ForgotPasswordCodePageState();
}

class _ForgotPasswordCodePageState extends State<ForgotPasswordCodePage> {
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
                        Observer(builder: (_) => AppInput(
                          hintText: "Código",
                          value: forgotPasswordController.code,
                          onChange: (value) => forgotPasswordController.code = value,
                          suffixIcon: AppIcons.code),
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
                                    child: Text("Verifique seu e-mail e informe o código enviado",
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
                    AppButton(text: "Confirmar", onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => ForgotPasswordChangePage()))),
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
