import 'package:flutter/painting.dart';
import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color backgroundColor = Color.fromRGBO(255, 255, 255, 1);
  static const Color backgroundFadedColor = Color.fromRGBO(255, 255, 255, 0.275);
  // static const Color cardColor = Color.fromRGBO(245, 224, 181, 1);
  static const Color primaryColor = Color.fromRGBO(102, 85, 95, 1);
  static const Color secondaryColor = Color.fromRGBO(245, 224, 181, 1);
  static const Color tertiaryColor = Color.fromRGBO(238, 168, 143, 1);
}

abstract class AppText {
  static const MainHeading = TextStyle(fontFamily: 'Open Sans EB', fontSize: 25, color: Colors.white);
  static const SubHeading = TextStyle(fontFamily: 'Open Sans EB', fontSize: 20, color: AppColors.primaryColor);
  static const TextBody = TextStyle(fontFamily: 'Open Sans M', fontSize: 15, color: AppColors.primaryColor);
}