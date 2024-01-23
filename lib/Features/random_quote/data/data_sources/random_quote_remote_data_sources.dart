import 'package:quotemaker/Core/api/end_points.dart';
import 'package:quotemaker/Features/random_quote/data/models/random_quote_model.dart';

import '../../../../Core/api/api_consumer.dart';

abstract class RandomQuoteRemoteDataSource {
  Future<RandomQuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource {
  ApiConsumer apiConsumer;

  RandomQuoteRemoteDataSourceImpl({
    required this.apiConsumer,
  });

  @override
  Future<RandomQuoteModel> getRandomQuote() async {
    final response =  await apiConsumer.get(EndPoint.baseUrl);
    return RandomQuoteModel.fromJson(response);
  }
}
