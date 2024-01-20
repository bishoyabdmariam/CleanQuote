import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotemaker/Features/favourite_quote/presentation/screens/favourite_quote_page.dart';
import 'package:quotemaker/Features/random_quote/presentation/screens/quote_screen.dart';

import '../../Features/random_quote/data/repositories/random_quote_repositories_imp.dart';
import '../../Features/random_quote/domain/repositories/random_quote_repositories.dart';
import '../../Features/random_quote/domain/use_cases/get_random_quote.dart';
import '../../Features/random_quote/presentation/cubit/random_quote_cubit.dart';

class Routes {
  static const String initialRoute = "/";
  static const String favouriteQuoteRoute = "/favouriteQuote";
}

/*
this is the normal routing

final routes={
  Routes.initialRoute : (context) =>const QuoteScreen(),
  Routes.favouriteQuoteRoute : (context) =>const FavouriteQuoteScreen(),
};
*/

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(


          builder: (context) =>
              BlocProvider(
                create: (_) => RandomQuoteCubit(
                  getRandomQuoteUseCase:GetRandomQuote(randomQuoteRepositories: RandomQuoteRepositories),
                ),
                child: const QuoteScreen(),
              )
        );

      case Routes.favouriteQuoteRoute:
        return MaterialPageRoute(
            builder: (context) => const FavouriteQuoteScreen());
      default:
        return null;
    }
  }
}
