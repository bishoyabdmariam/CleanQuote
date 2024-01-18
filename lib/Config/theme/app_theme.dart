import 'package:flutter/material.dart';
import 'package:quotemaker/Core/utils/app_colors.dart';
import 'package:quotemaker/Core/utils/app_strings.dart';

ThemeData appTheme() {
  return ThemeData(

    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ),
    primaryColor: AppColors.primary,
    hintColor: AppColors.hint,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        height: 1.3,
        fontSize: 22,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontFamily: AppStrings.fontFamily,
      ),
    ),
  );
}
