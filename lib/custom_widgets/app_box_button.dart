import 'package:flutter/material.dart';
import 'package:murieta/themes/app_colors.dart';
import 'package:murieta/themes/app_dimensions.dart';

class AppBoxButton extends StatelessWidget {
  Widget content;
  Function onTap;
  double width;
  double heigth;
  Color color;

  AppBoxButton({required this.content, required this.onTap, required this.width, required this.heigth, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        width: width,
        height: heigth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: content
            ),
          ],
        ),
      ),
    );
  }
}