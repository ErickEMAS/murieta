import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:murieta/themes/app_colors.dart';

class AppInput extends StatelessWidget {
  bool obscureText;
  String? value;
  String? hintText;
  TextEditingController? textEditingController;
  FormFieldValidator<String>? validator;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  FocusNode? focusNode;
  FocusNode? nextFocus;
  Function(dynamic) onChange;
  Function? onTap;
  List<TextInputFormatter>? inputFormatters;

  AppInput(
    {
      required this.onChange,
      this.onTap,
      required this.hintText,
      this.value,
      this.obscureText = false,
      this.textEditingController,
      this.validator,
      this.keyboardType,
      this.textInputAction,
      this.focusNode,
      this.nextFocus,
      this.inputFormatters,
    }
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: hintText,
        focusColor: AppColors.primary,
        contentPadding: EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 20))),
    );
  }
}