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
  Widget? suffixIcon;
  Function? suffixFunction;

  AppInput(
    {
      required this.onChange,
      required this.hintText,
      this.value,
      this.obscureText = false,
      this.textEditingController,
      this.validator,
      this.keyboardType,
      this.textInputAction,
      this.focusNode,
      this.nextFocus,
      this.suffixIcon,
      this.suffixFunction,
    }
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (textEditingController == null){
      textEditingController = new TextEditingController();

      if (value != null) {
        textEditingController!.text = value!;
        textEditingController!.selection = TextSelection.fromPosition(TextPosition(offset: textEditingController!.text.length));
      }
    }
    return Container(
      width: size.width - 32,
      decoration: BoxDecoration(
        color: AppColors.background01dp,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            height: 52,
            width: size.width - 72,
            child: TextFormField(
              onChanged: (data) {
                onChange(data);
              },
              controller: textEditingController,
              obscureText: obscureText,
              validator: validator,
              keyboardType: keyboardType,
              focusNode: focusNode,
              decoration: InputDecoration(
                labelText: hintText,
                contentPadding: EdgeInsets.all(16),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 20))),
            ),
          ),
          Container(
            width: 40,
            padding: EdgeInsets.fromLTRB(0, 16, 16, 16),
            child: Center(
              child: GestureDetector(
                child: suffixIcon,
                onTap: () => suffixFunction == null ? {} : suffixFunction!(),
              ),
            )
          ),
        ],
      ),
    );
  }
}