import 'dart:async';


import 'package:flutter/material.dart';
import 'package:murieta/custom_widgets/app_button.widget.dart';
import 'package:murieta/custom_widgets/app_input.dart';
import 'package:murieta/pages/auth/signup/signup_page.dart';
import 'package:murieta/themes/app_colors.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

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
                  bottomLeft: Radius.circular(100),
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text("Login",
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
                    child: AppButton(text: "Login", onPressed: () {},),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Não pussui uma conta?"),
                        SizedBox(width: 8,),
                        GestureDetector(
                          child: Text("Cadastre-se?",
                            style: TextStyle(color: AppColors.secondary),),
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()),
                      ),),
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
