import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.primaryColor,
    cursorColor: AppColors.primaryColor,
    accentColor: AppColors.primaryColor,
  );
}

class AppColors {

  static const primaryColor = Color(0xFFf50057);
  static const defaultColor = Color(0xFF757575);
  static const secondaryColor = Color(0xFFab47bc);
  static const lightColor = Color(0xFFe0e0e0);
}

class AppStyles {

  static const defaultTextStyle = TextStyle(color: Color(0xffffffff));

  static const double gap_16 = 16;
}
