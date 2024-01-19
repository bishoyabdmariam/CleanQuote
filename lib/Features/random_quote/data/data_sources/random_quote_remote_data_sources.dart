import 'dart:convert';

import 'package:quotemaker/Core/api/end_points.dart';
import 'package:quotemaker/Core/error/exception.dart';
import 'package:quotemaker/Features/random_quote/data/models/random_quote_model.dart';
import 'package:http/http.dart' as http;

abstract class RandomQuoteRemoteDataSource {
  Future<RandomQuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource {
  http.Client client;

  RandomQuoteRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<RandomQuoteModel> getRandomQuote()async {
    final randomQuoteURL = Uri.parse(EndPoint.baseUrl);
    final response  = await client.get(randomQuoteURL, headers: {
      'Content-Type' : 'application/json'
    });
    if(response.statusCode ==200){
      return RandomQuoteModel.fromJson(json.decode(response.body));
    }else{
       throw ServerException();
    }
  }
}
