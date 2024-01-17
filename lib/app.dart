import 'package:flutter/material.dart';
import 'package:quotemaker/Config/routes/app_routes.dart';
import 'package:quotemaker/Config/theme/app_theme.dart';
import 'package:quotemaker/Core/utils/app_colors.dart';
import 'package:quotemaker/Core/utils/app_strings.dart';
class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: appTheme(),/*
      routes: routes,
      initialRoute: Routes.initialRoute,*/
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
