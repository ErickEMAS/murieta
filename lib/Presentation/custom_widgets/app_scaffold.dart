import 'package:flutter/material.dart';
import 'package:murieta/core/themes/app_colors.dart';

class AppScaffold extends StatelessWidget {
  String appBarText;
  IconData? appBarIcon;
  Widget? appBarSuffixIcon;
  Widget body;

  AppScaffold({required this.appBarText, this.appBarIcon, this.appBarSuffixIcon, required this.body,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: appBarIcon != null ? false : true,
        title: appBarIcon != null ? Row(
          children: [
            Icon(
              appBarIcon,
              color: AppColors.primary
            ),
            SizedBox(width: 16),
            Text(
              appBarText,
              style: TextStyle(
                color: AppColors.white, 
              ),
            ),
          ],
        )
        : Text(
          appBarText,
          style: TextStyle(
            color: AppColors.white, 
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 16),
            child: appBarSuffixIcon,
          )
        ],
      ),
      body: body,
    );
  }
}