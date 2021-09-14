import 'dart:async';


import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _loginController = TextEditingController();

  final _passwordController = TextEditingController();

  var _formKey = GlobalKey<FormState>();

  final _focusPassword = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }

  _onClickLogin() async {
    bool formOk = _formKey.currentState!.validate();
    if (!formOk) return;

    String login = _loginController.text;
    String password = _passwordController.text;
  }

  _validator(String text) {
    if (text.isEmpty) return "text";

    return null;
  }

  String? _validateLogin(String? text) {
    if (text!.isEmpty) return "Campo Login Vazio";

    return null;
  }

  String? _validatePassword(String? text) {
    if (text!.isEmpty) return "Campo Senha Vazio";

    if (text.length < 3) return "A senha precisa ter no minimo 4 caracteres";

    return null;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
