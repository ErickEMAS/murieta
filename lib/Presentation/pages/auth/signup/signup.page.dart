import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:murieta/Presentation/custom_widgets/app_button.widget.dart';
import 'package:murieta/Presentation/custom_widgets/app_input.dart';
import 'package:murieta/Presentation/pages/auth/login/login.page.dart';
import 'package:murieta/Presentation/pages/auth/signup/signup.controller.dart';
import 'package:murieta/core/themes/app_colors.dart';
import 'package:murieta/core/themes/app_dimensions.dart';
import 'package:murieta/core/themes/app_icon.dart';
import 'package:murieta/core/themes/logo_murieta.dart';

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
                                              nextFocus: email,
                                              hintText: "Username", 
                                              suffixIcon: Icon(AppIcons.person), 
                                              value: signupController.signUp.username,
                                              onChange: (value) => signupController.signUp.username = value,
                                            ),
                                            AppInput(
                                              focusNode: email,
                                              nextFocus: password,
                                              hintText: "E-mail", 
                                              suffixIcon: Icon(AppIcons.email), 
                                              value: signupController.signUp.email,
                                              onChange: (value) => signupController.signUp.email = value,
                                            ),
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
                                        AppButton(text: "Cadastrar-se", onPressed: (){
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
