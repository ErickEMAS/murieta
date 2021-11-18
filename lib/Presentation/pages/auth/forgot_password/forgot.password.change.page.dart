import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:murieta/Presentation/custom_widgets/app_button.widget.dart';
import 'package:murieta/Presentation/custom_widgets/app_input.dart';
import 'package:murieta/Presentation/pages/auth/forgot_password/forgot.password.controller.dart';
import 'package:murieta/Presentation/pages/auth/login/login.page.dart';
import 'package:murieta/core/themes/app_colors.dart';
import 'package:murieta/core/themes/app_dimensions.dart';
import 'package:murieta/core/themes/logo_murieta.dart';

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
      body: SafeArea(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: appWidth(context: context),
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
