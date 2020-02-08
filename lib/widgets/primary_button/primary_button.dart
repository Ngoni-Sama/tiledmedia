import 'package:flutter/material.dart';
import 'package:tiledmedia/util/theme.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final TextStyle buttonTextStyle;
  final String buttonName;

  //passing props in react style
  PrimaryButton({
    this.buttonName,
    this.onPressed,
    this.buttonTextStyle = AppStyles.defaultTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      child: new Text(buttonName, textDirection: TextDirection.ltr, style: buttonTextStyle),
      color: AppColors.primaryColor,
      onPressed: onPressed,
    );
  }
}
