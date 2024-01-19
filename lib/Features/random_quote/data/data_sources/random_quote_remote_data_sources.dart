

import 'package:quotemaker/Features/random_quote/data/models/random_quote_model.dart';


abstract class  RandomQuoteRemoteDataSource {

 Future<RandomQuoteModel> getRandomQuote();

 }

class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource   {

  
}
