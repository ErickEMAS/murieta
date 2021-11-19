import 'package:flutter/material.dart';
import 'package:murieta/Presentation/custom_widgets/app_box_button.dart';
import 'package:murieta/Presentation/custom_widgets/app_scaffold.dart';
import 'package:murieta/Presentation/pages/settings/settings.controller.dart';
import 'package:murieta/core/themes/app_colors.dart';
import 'package:murieta/core/themes/app_dimensions.dart';
import 'package:murieta/core/themes/app_icon.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _settingsController = new SettingsController();

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
                  SizedBox(width: 16),
                  AppBoxButton(
                    content: Column(
                      children: [
                        Icon(
                          AppIcons.settings,
                          color: AppColors.white,
                          size: appIconDashPage(context: context),
                        ),
                        Text(
                          "Configurações",
                          style: TextStyle(
                            fontSize: appFontSizeDashPage(context: context),
                            color: AppColors.white
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
                          color: AppColors.white,
                          size: appIconDashPage(context: context),
                        ),
                        Text(
                          "Configurações",
                          style: TextStyle(
                            fontSize: appFontSizeDashPage(context: context),
                            color: AppColors.white
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
                          AppIcons.logout,
                          color: AppColors.primary100,
                          size: appIconDashPage(context: context),
                        ),
                        Text(
                          "Logout",
                          style: TextStyle(
                            fontSize: appFontSizeDashPage(context: context),
                            color: AppColors.primary100
                          ),
                        ),
                      ],
                    ), 
                    onTap: () => _settingsController.logout(context: context), 
                    width: appMinBoxWidthDashPage(context: context), 
                    heigth: appBoxHeightDashPage(context: context), 
                    color: AppColors.error
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
