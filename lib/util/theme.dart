import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    cursorColor: AppColors.primary,
    accentColor: AppColors.primary,
  );
}

class AppColors {

  static const primary = Color(0xFFE32B65);

}

class AppStyles {

  static const defaultTextStyle = TextStyle(color: Color(0xffffffff));

  static const double dGap = 16;
}
