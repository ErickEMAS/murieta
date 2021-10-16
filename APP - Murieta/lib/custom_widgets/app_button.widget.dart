import 'package:flutter/material.dart';
import 'package:murieta/themes/app_colors.dart';

class AppButton extends StatelessWidget {
  String text;
  double? width;
  double? height;
  double? fontSize;
  var onPressed;

  AppButton({required this.text, required this.onPressed, this.width, this.height, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width  ?? MediaQuery.of(context).size.width,
      height: height ?? 45,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(AppColors.primary),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: AppColors.primary,
              ),
            ),
          ),
        ),
        onPressed: () {
          onPressed();
        },
        child: Container(
          margin: EdgeInsets.zero,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              text,
              style: TextStyle(
                color: AppColors.white,
                fontSize: fontSize ?? 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
