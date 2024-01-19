

 import 'package:quotemaker/Features/random_quote/data/models/random_quote_model.dart';

abstract class  RandomQuoteLocalDataSource {
  Future<RandomQuoteModel> getLastRandomQuote();
  Future<void> cacheQuote(RandomQuoteModel randomQuoteModel);
 }
  
 class RandomQuoteLocalDataSourceImpl implements RandomQuoteLocalDataSource   {
  
}
