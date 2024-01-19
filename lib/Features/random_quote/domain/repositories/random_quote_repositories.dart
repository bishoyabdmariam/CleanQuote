

import 'package:dartz/dartz.dart';

import '../../../../Core/error/failures.dart';
import '../entities/quote.dart';

abstract class RandomQuoteRepositories {
  Future<Either<Failure, Quote>> getRandomQuote();
}
