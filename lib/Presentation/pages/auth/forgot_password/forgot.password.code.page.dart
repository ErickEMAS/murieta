import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:murieta/Presentation/custom_widgets/app_button.widget.dart';
import 'package:murieta/Presentation/custom_widgets/app_input.dart';
import 'package:murieta/Presentation/pages/auth/forgot_password/forgot.password.change.page.dart';
import 'package:murieta/Presentation/pages/auth/forgot_password/forgot.password.controller.dart';
import 'package:murieta/Presentation/pages/auth/login/login.page.dart';
import 'package:murieta/core/themes/app_colors.dart';
import 'package:murieta/core/themes/app_dimensions.dart';
import 'package:murieta/core/themes/app_icon.dart';
import 'package:murieta/core/themes/logo_murieta.dart';

class ForgotPasswordCodePage extends StatefulWidget {
  @override
  _ForgotPasswordCodePageState createState() => _ForgotPasswordCodePageState();
}

class _ForgotPasswordCodePageState extends State<ForgotPasswordCodePage> {
  final forgotPasswordController = new ForgotPasswordController();
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = appWidth(context: context);
    return Scaffold(
      body: SafeArea(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width,
              child: Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.only(bottom: 16, left: 16, right: 16),
                  child: Column(
                    children: [
                      Container(
                        height: appHeightHeaderAuthPage(context: context),
                        child: logo(context: context),
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            Container(
                              height: appHeightBodyAuthPage(context: context) - 16,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Observer(builder: (_) => AppInput(
                                              hintText: "Código",
                                              value: forgotPasswordController.code,
                                              onChange: (value) => forgotPasswordController.code = value,
                                              suffixIcon: Icon(AppIcons.code)),
                                            ),
                                            SizedBox(height: 12),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  width: width * 0.7,
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
                                        AppButton(text: "Confirmar", onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ForgotPasswordChangePage()))),
                                        GestureDetector(
                                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => LoginPage())),
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
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
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
