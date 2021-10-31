import 'package:flutter/material.dart';

  double appWidth({required BuildContext context}) => MediaQuery.of(context).size.width > 480 ? 480 : MediaQuery.of(context).size.width;
  double appHeight({required BuildContext context}) => MediaQuery.of(context).size.height;
  double appSizeIconLogo({required BuildContext context}) => MediaQuery.of(context).size.width > 480 ? 112 : MediaQuery.of(context).size.width / 4;
  double appFontSizeLogo({required BuildContext context}) => (MediaQuery.of(context).size.width > 480 ? 112 : MediaQuery.of(context).size.width / 4) * 0.5714285714285714;
  double appHeightHeaderAuthPage({required BuildContext context}) => MediaQuery.of(context).size.height * 0.4 - 32;
  double appHeightBodyAuthPage({required BuildContext context}) => MediaQuery.of(context).size.height * 0.6 - 32 < 416 ? 416 : MediaQuery.of(context).size.height * 0.6 - 32;