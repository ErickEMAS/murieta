import 'dart:async';


import 'package:flutter/material.dart';
import 'package:murieta/custom_widgets/app_button.widget.dart';
import 'package:murieta/custom_widgets/app_input.dart';
import 'package:murieta/pages/login_page.dart';
import 'package:murieta/themes/app_colors.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  var _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        color: AppColors.background,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColors.primary, 
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(100),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Icon(
                      Icons.person, 
                      color: AppColors.white, 
                      size: 100,
                    ), 
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text("Sign-up",
                          style: TextStyle(fontSize: 32),),
                      ),
                    ],
                  ),
              ],),
            ),
            SizedBox(height: 80,),
            Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    child: AppInput(hintText: "Nome", onChange: (a) {  },),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: AppInput(hintText: "E-mail", onChange: (a) {  },),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: AppInput(hintText: "Senha", onChange: (a) {  },),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: AppInput(hintText: "Confirmar Senha", onChange: (a) {  },),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: AppButton(text: "Cadastrar-se", onPressed: () {},),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Já pussui uma conta?"),
                        SizedBox(width: 8,),
                        GestureDetector(
                          child: Text("Acessar",
                            style: TextStyle(color: AppColors.secondary),),
                          onTap: () => Navigator.pop(context)),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
