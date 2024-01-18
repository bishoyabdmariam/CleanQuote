import 'package:flutter/material.dart';
import 'package:quotemaker/Config/theme/app_theme.dart';
import 'package:quotemaker/Core/utils/app_colors.dart';

class QuoteContent extends StatelessWidget {
  const QuoteContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        15,
      ),
      margin: const EdgeInsets.all(
        20,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
           Text(
            "Mesuring Programming progress by lines of code is like measuring aircraft building progress by weight ",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 15,
            ),
            child: const Text(
              "Bill Gates",
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.3,
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
