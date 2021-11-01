import 'package:flutter/material.dart';

  double appWidth({required BuildContext context}) => MediaQuery.of(context).size.width > 480 ? 480 : MediaQuery.of(context).size.width;
  double appHeight({required BuildContext context}) => MediaQuery.of(context).size.height;
  double appHeightSafeArea({required BuildContext context}) => MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - 56;
  double appSizeIconLogo({required BuildContext context}) => appWidth(context: context) / 4;
  double appFontSizeLogo({required BuildContext context}) => appSizeIconLogo(context: context) * 0.5714285714285714;
  //Auth Pages
  double appHeightHeaderAuthPage({required BuildContext context}) => MediaQuery.of(context).size.height * 0.4 - 32;
  double appHeightBodyAuthPage({required BuildContext context}) => MediaQuery.of(context).size.height * 0.6 - 32 < 416 ? 416 : MediaQuery.of(context).size.height * 0.6 - 32;
  //Dashboard
  double appBoxHeightDashPage({required BuildContext context}) => appMinBoxWidthDashPage(context: context);
  double appMaxBoxWidthDashPage({required BuildContext context}) => appWidth(context: context) - 32;
  double appMinBoxWidthDashPage({required BuildContext context}) => (appWidth(context: context) - 48) / 2;
  double appGrapgicWidthDashPage({required BuildContext context}) => (appMaxBoxWidthDashPage(context: context) - 32) / 13;
  double appGrapgicHeightDashPage({required BuildContext context}) => (appBoxHeightDashPage(context: context) - 50) * 0.71;
  double appIconDashPage({required BuildContext context}) => appBoxHeightDashPage(context: context) / 4;
  double appFontSizeDashPage({required BuildContext context}) => appIconDashPage(context: context) * 0.375;
  double appBoxImageSizeDashPage({required BuildContext context}) => appBoxHeightDashPage(context: context) * 0.6;
  double appNameFontSizeDashPage({required BuildContext context}) => appBoxImageSizeDashPage(context: context) * 0.3214;