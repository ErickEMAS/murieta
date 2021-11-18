import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:murieta/custom_widgets/app_box_button.dart';
import 'package:murieta/custom_widgets/app_scaffold.dart';
import 'package:murieta/custom_widgets/dasboard/graphic_item.dart';
import 'package:murieta/themes/app_colors.dart';
import 'package:murieta/themes/app_dimensions.dart';
import 'package:murieta/themes/app_icon.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarText: "Configurações",
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: appWidth(context: context),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppBoxButton(
                    content: Column(
                      children: [
                        Icon(
                          AppIcons.settings,
                          color: AppColors.white10,
                          size: appIconDashPage(context: context),
                        ),
                        Text(
                          "Configurações",
                          style: TextStyle(
                            fontSize: appFontSizeDashPage(context: context),
                            color: AppColors.white10
                          ),
                        ),
                      ],
                    ), 
                    onTap: () => print("Tocado"), 
                    width: appMinBoxWidthDashPage(context: context), 
                    heigth: appBoxHeightDashPage(context: context), 
                    color: AppColors.background01dp,
                  ),
                  SizedBox(width: 16),
                  AppBoxButton(
                    content: Column(
                      children: [
                        Icon(
                          AppIcons.darkMode,
                          color: AppColors.primary100,
                          size: appIconDashPage(context: context),
                        ),
                        Text(
                          "DarkMode",
                          style: TextStyle(
                            fontSize: appFontSizeDashPage(context: context),
                            color: AppColors.primary100
                          ),
                        ),
                      ],
                    ), 
                    onTap: () => print("Tocado"), 
                    width: appMinBoxWidthDashPage(context: context), 
                    heigth: appBoxHeightDashPage(context: context), 
                    color: AppColors.primary,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppBoxButton(
                    content: Column(
                      children: [
                        Icon(
                          AppIcons.settings,
                          color: AppColors.white10,
                          size: appIconDashPage(context: context),
                        ),
                        Text(
                          "Configurações",
                          style: TextStyle(
                            fontSize: appFontSizeDashPage(context: context),
                            color: AppColors.white10
                          ),
                        ),
                      ],
                    ), 
                    onTap: () => print("Tocado"), 
                    width: appMinBoxWidthDashPage(context: context), 
                    heigth: appBoxHeightDashPage(context: context), 
                    color: AppColors.background01dp,
                  ),
                  SizedBox(width: 16),
                  AppBoxButton(
                    content: Column(
                      children: [
                        Icon(
                          AppIcons.settings,
                          color: AppColors.white10,
                          size: appIconDashPage(context: context),
                        ),
                        Text(
                          "Configurações",
                          style: TextStyle(
                            fontSize: appFontSizeDashPage(context: context),
                            color: AppColors.white10
                          ),
                        ),
                      ],
                    ), 
                    onTap: () => print("Tocado"), 
                    width: appMinBoxWidthDashPage(context: context), 
                    heigth: appBoxHeightDashPage(context: context), 
                    color: AppColors.background01dp,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppBoxButton(
                    content: Column(
                      children: [
                        Icon(
                          AppIcons.settings,
                          color: AppColors.white10,
                          size: appIconDashPage(context: context),
                        ),
                        Text(
                          "Configurações",
                          style: TextStyle(
                            fontSize: appFontSizeDashPage(context: context),
                            color: AppColors.white10
                          ),
                        ),
                      ],
                    ), 
                    onTap: () => print("Tocado"), 
                    width: appMinBoxWidthDashPage(context: context), 
                    heigth: appBoxHeightDashPage(context: context), 
                    color: AppColors.background01dp,
                  ),
                  SizedBox(width: 16),
                  AppBoxButton(
                    content: Column(
                      children: [
                        Icon(
                          AppIcons.settings,
                          color: AppColors.white10,
                          size: appIconDashPage(context: context),
                        ),
                        Text(
                          "Configurações",
                          style: TextStyle(
                            fontSize: appFontSizeDashPage(context: context),
                            color: AppColors.white10
                          ),
                        ),
                      ],
                    ), 
                    onTap: () => print("Tocado"), 
                    width: appMinBoxWidthDashPage(context: context), 
                    heigth: appBoxHeightDashPage(context: context), 
                    color: AppColors.background01dp,
                  ),
                ],
              ),       
                       
            ],
          ),
        ),
      ),
      
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
