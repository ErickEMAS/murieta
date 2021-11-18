import 'package:flutter/material.dart';

class GraphicItem extends StatelessWidget {
  String weekday;
  double width;
  double height;
  double fontSize;
  double percentage;
  Color color;

  GraphicItem({required this.weekday, required this.width, required this.height, required this.percentage, required this.color, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: width,
              height: height,
            ),
            Container(
              width: width,
              height: height * (percentage / 100),
              color: color,
            ),
          ],
        ),
        SizedBox(height: 2),
        Text(
          weekday,
          style: TextStyle(
            fontSize: fontSize
          ),  
        ),
      ],
    );
  }
}