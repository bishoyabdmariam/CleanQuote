import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotemaker/Features/favourite_quote/presentation/screens/favourite_quote_page.dart';
import 'package:quotemaker/Features/random_quote/presentation/screens/quote_screen.dart';

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
        return MaterialPageRoute(builder: (context) => const QuoteScreen());
      case Routes.favouriteQuoteRoute:
        return MaterialPageRoute(
            builder: (context) => const FavouriteQuoteScreen());
      default:
        return null;
    }
  }
}
