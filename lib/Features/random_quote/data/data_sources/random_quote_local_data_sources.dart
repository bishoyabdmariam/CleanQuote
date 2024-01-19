import 'dart:convert';

import 'package:quotemaker/Core/error/exception.dart';
import 'package:quotemaker/Core/utils/app_strings.dart';
import 'package:quotemaker/Features/random_quote/data/models/random_quote_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RandomQuoteLocalDataSource {
  Future<RandomQuoteModel> getLastRandomQuote();

  Future<void> cacheQuote(RandomQuoteModel randomQuoteModel);
}

class RandomQuoteLocalDataSourceImpl implements RandomQuoteLocalDataSource {
  final SharedPreferences sharedPreferences;

  RandomQuoteLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<RandomQuoteModel> getLastRandomQuote() {
    final jsonString  = sharedPreferences.getString(AppStrings.cachedRandomQuote);
    if(jsonString !=null){
      final cacheRandomQuote = Future.value(RandomQuoteModel.fromJson(json.decode(jsonString)));
      return cacheRandomQuote;
    }else{
      throw CacheException();
    }
  }

  @override
  Future<void> cacheQuote(RandomQuoteModel randomQuote) {
    return sharedPreferences.setString(AppStrings.cachedRandomQuote, json.encode(randomQuote));
  }
}
