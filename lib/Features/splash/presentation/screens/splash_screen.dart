import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quotemaker/Config/routes/app_routes.dart';
import 'package:quotemaker/Core/utils/assets_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;

  void goNext() {
    Navigator.of(context).pushReplacementNamed(Routes.randomQuoteRoute);
  }

  void startDelay() {
    timer = Timer(const Duration(seconds: 3), () {
      goNext();
    });
  }

  @override
  void initState() {
    startDelay();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(ImgAssets.splash),
      ),
    );
  }
}
