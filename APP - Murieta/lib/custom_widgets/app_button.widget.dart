import 'package:flutter/material.dart';
import 'package:murieta/themes/app_colors.dart';
import 'package:murieta/themes/app_dimensions.dart';

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
      width: width  ?? appWidth(context: context),
      height: height ?? 56,
      margin: EdgeInsets.only(top: 16, bottom: 16),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(AppColors.primary),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
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
                color: AppColors.primary100,
                fontSize: fontSize ?? 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
