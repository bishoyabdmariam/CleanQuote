import 'package:dartz/dartz.dart';
import 'package:quotemaker/Core/error/exception.dart';

import 'package:quotemaker/Core/error/failures.dart';
import 'package:quotemaker/Core/network/network_info.dart';
import 'package:quotemaker/Features/random_quote/data/data_sources/random_quote_local_data_sources.dart';
import 'package:quotemaker/Features/random_quote/data/data_sources/random_quote_remote_data_sources.dart';

import 'package:quotemaker/Features/random_quote/domain/entities/quote.dart';

import '../../domain/repositories/random_quote_repositories.dart';

class RandomQuoteRepositoriesImp implements RandomQuoteRepositories {
  final NetworkInfo networkInfo;
  final RandomQuoteLocalDataSource randomQuoteLocalDataSource;
  final RandomQuoteRemoteDataSource randomQuoteRemoteDataSource;

  RandomQuoteRepositoriesImp({
    required this.networkInfo,
    required this.randomQuoteRemoteDataSource,
    required this.randomQuoteLocalDataSource,
  });

  @override
  Future<Either<Failure, Quote>> getRandomQuote()async {
    if(await networkInfo.isConnected){
     try{
       var quote =  await randomQuoteRemoteDataSource.getRandomQuote();
        randomQuoteLocalDataSource.cacheQuote(quote);
       return Right(quote);
     } on ServerException {
        return Left(ServerFailure());
     }

    }else{
      try{
        var cachedQuote = await randomQuoteLocalDataSource.getLastRandomQuote();
        return Right(cachedQuote);
      }on CacheException{
        return Left(CacheFailure());
      }
    }
  }
}
