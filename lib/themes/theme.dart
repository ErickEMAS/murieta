
import 'package:flutter/material.dart';
import 'package:murieta/themes/app_colors.dart';

ThemeData DarkMode() {
  return ThemeData(
    primaryColor: AppColors.primary,
    accentColor: AppColors.secondary,
    scaffoldBackgroundColor: AppColors.background,
    // Cor para o Radio Button selecionado
    toggleableActiveColor: AppColors.primary,
    appBarTheme: AppBarTheme(
        color: AppColors.background01dp,
        iconTheme: IconThemeData(color: AppColors.white)
    ),
    brightness: Brightness.dark,
    primarySwatch: MaterialColor( 
    AppColors.primary.value, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch. 
    <int, Color>{ 
      50: Color(AppColors.primary10.value),//10% 
      100: Color(AppColors.primary20.value),//20% 
      200: Color(AppColors.primary30.value),//30% 
      300: Color(AppColors.primary40.value),//40% 
      400: Color(AppColors.primary50.value),//50% 
      500: Color(AppColors.primary60.value),//60% 
      600: Color(AppColors.primary70.value),//70% 
      700: Color(AppColors.primary80.value),//80% 
      800: Color(AppColors.primary90.value),//90% 
      900: Color(AppColors.primary100.value),//100% 
    }, 
  ),
    buttonTheme: ButtonThemeData(
        buttonColor: AppColors.primary,
        disabledColor: AppColors.background
    ),
  );
}