import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:murieta/Presentation/custom_widgets/app_button.widget.dart';
import 'package:murieta/Presentation/custom_widgets/app_input.dart';
import 'package:murieta/Presentation/pages/auth/forgot_password/forgot.password.email.page.dart';
import 'package:murieta/Presentation/pages/auth/login/login.controller.dart';
import 'package:murieta/Presentation/pages/auth/signup/signup.page.dart';
import 'package:murieta/core/themes/app_colors.dart';
import 'package:murieta/core/themes/app_dimensions.dart';
import 'package:murieta/core/themes/app_icon.dart';
import 'package:murieta/core/themes/logo_murieta.dart';

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
    return Scaffold(
      body: SafeArea(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: appWidth(context: context),
              child: Form(
                key: _formKey,
                child: Container(
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
                              height: appHeightBodyAuthPage(context: context),
                              padding: EdgeInsets.only(bottom: 16, left: 16, right: 16),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            AppInput(
                                              nextFocus: password,
                                              hintText: "E-mail", 
                                              value: loginController.loginDTO.email,
                                              onChange: (value) => loginController.loginDTO.email = value,
                                              suffixIcon: Icon(AppIcons.email),
                                            ),
                                            Observer(builder: (_) => AppInput(
                                              focusNode: password,
                                              hintText: "Senha",
                                              value: loginController.loginDTO.password,
                                              onChange: (value) => loginController.loginDTO.password = value,
                                              obscureText: loginController.passwordHidden,
                                              suffixIcon: loginController.passwordIcon,
                                              suffixFunction: () => loginController.changeShowPassword(context: context)),
                                            ),
                                            SizedBox(height: 12),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                GestureDetector(
                                                  onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => ForgotPasswordEmailPage())),
                                                  child: Text(
                                                    "Esqueceu a senha?",
                                                    style: TextStyle(
                                                      fontSize: 14
                                                    ),
                                                  ),                            
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        AppButton(text: "Login", onPressed: () => loginController.login(context: context)),
                                        GestureDetector(
                                          onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => SignUpPage())),
                                          child: Text(
                                            "Cadastrar-se",
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
