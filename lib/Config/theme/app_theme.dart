import 'package:flutter/material.dart';
import 'package:quotemaker/Core/utils/app_colors.dart';
import 'package:quotemaker/Core/utils/app_strings.dart';

ThemeData appTheme(){
  return ThemeData(
    primaryColor: AppColors.primary,
    hintColor: AppColors.hint,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      labelLarge: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontFamily:AppStrings.fontFamily,
      )
    )
  );
}
