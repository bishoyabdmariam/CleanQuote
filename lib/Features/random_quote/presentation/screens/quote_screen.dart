import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quotemaker/Core/utils/app_colors.dart';
import 'package:quotemaker/Core/utils/app_strings.dart';
import 'package:quotemaker/Features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:quotemaker/Features/random_quote/presentation/cubit/random_quote_state.dart';
import 'package:quotemaker/Features/random_quote/presentation/widgets/quote_content.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  _getRandomQuote() async {
    BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();
  }

  @override
  void initState() {
    _getRandomQuote();

    super.initState();
  }

  Widget _buildBodyContent() {
    return BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
        builder: (context, state) {
      if (state is RandomQuoteStateLoading) {
        return const Center(
          child: SpinKitRing(
            color: Colors.black,
          ),
        );
      } else if (state is RandomQuoteStateFailure) {
        return Column(
          children: [
          ],
        );
      } else if (state is RandomQuoteStateSuccess) {
        return Column(
          children: [
            QuoteContent(quote: state.quote),
            InkWell(
              onTap: _getRandomQuote,
              child: Container(
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
            ),
          ],
        );
      } else {
        return const Center(
          child: SpinKitDancingSquare(
            color: Colors.black,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppBar appBar = AppBar(
      title: const Text(AppStrings.appName),
    );

    return RefreshIndicator(
      onRefresh: () async {
        _getRandomQuote();
      },
      child: Scaffold(
        appBar: appBar,
        body: _buildBodyContent(),
      ),
    );
  }
}
