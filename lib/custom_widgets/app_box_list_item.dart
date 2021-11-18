import 'package:flutter/material.dart';
import 'package:murieta/themes/app_colors.dart';
import 'package:murieta/themes/app_dimensions.dart';

class AppBoxListItem extends StatelessWidget {
  String content;
  Function onTap;
  bool header;
  IconData? icon;

  AppBoxListItem({required this.content, required this.onTap, required this.header, this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(top: 16, right: 16, left: 16),
        decoration: BoxDecoration(
          color: header ? AppColors.secondary : AppColors.background04dp,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            icon == null ? Container() : Container(
              margin: EdgeInsets.only(right: 16),
              child: Icon(
                icon,
              ),
            ),
            Expanded(
              child: Text(
                content,
                textAlign: header ? TextAlign.center : TextAlign.start,
                style: TextStyle(
                  color: header ? AppColors.primary100 : AppColors.white,
                  fontWeight: header ? FontWeight.bold : FontWeight.normal,
                  fontSize: appFontSizeDashPage(context: context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}