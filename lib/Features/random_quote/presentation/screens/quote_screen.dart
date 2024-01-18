import 'package:flutter/material.dart';
import 'package:quotemaker/Core/utils/app_colors.dart';
import 'package:quotemaker/Core/utils/app_strings.dart';
import 'package:quotemaker/Core/utils/constants.dart';
import 'package:quotemaker/Features/random_quote/presentation/widgets/quote_content.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  Widget _buildBodyContent() {
    return Column(
      children: [
        const QuoteContent(),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary,
          ),
          child: const Icon(
            Icons.refresh,
            size: 28,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppBar appBar = AppBar(
      title: const Text(AppStrings.appName),
    );

    return Scaffold(
      appBar: appBar,
      body: _buildBodyContent(),
    );
  }
}
