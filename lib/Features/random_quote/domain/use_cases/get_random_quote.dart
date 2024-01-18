import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:quotemaker/Core/usecases/usecase.dart';

import '../../../../Core/error/failures.dart';
import '../entities/quote.dart';

class GetRandomQuote implements UseCase<Quote, NoParams> {
  @override
  Future<Either<Failure, Quote>> call(NoParams params) {

  }
}


// we will not use this put if we want we will change a bit in the up class to suitable with this
/*class LoginParams extends Equatable {
  final String userName;
  final String password;

  const LoginParams({
    required this.userName,
    required this.password,
  });

  @override
  List<Object?> get props => [
        userName,
        password,
      ];
}*/
