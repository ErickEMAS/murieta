import 'package:flutter/cupertino.dart';
import 'package:murieta/themes/app_colors.dart';
import 'package:murieta/themes/app_dimensions.dart';
import 'package:murieta/themes/app_icon.dart';

Widget logo({required BuildContext context}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        AppIcons.logo,
        color: AppColors.primary,
        size: appSizeIconLogo(context: context),
      ),
      Text(
        "Murieta",
        style: TextStyle(
          fontSize: appFontSizeLogo(context: context),
        ),
      ),
    ],
  );
}