import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotemaker/Core/error/failures.dart';
import 'package:quotemaker/Core/usecases/usecase.dart';
import 'package:quotemaker/Core/utils/app_strings.dart';
import 'package:quotemaker/Features/random_quote/domain/entities/quote.dart';
import '../../domain/use_cases/get_random_quote.dart';
import 'random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  final GetRandomQuote getRandomQuoteUseCase;

  RandomQuoteCubit({required this.getRandomQuoteUseCase})
      : super(RandomQuoteStateInitial());

  Future<void> getRandomQuote() async {
    emit(RandomQuoteStateLoading());
    Either<Failure, Quote> response = await getRandomQuoteUseCase(NoParams());

    emit(response.fold(
      (failure) => RandomQuoteStateFailure(
        msg: _mapFailureToMSG(failure),
      ),
      (quote) => RandomQuoteStateSuccess(
        quote: quote,
      ),
    ));
  }

  String _mapFailureToMSG(Failure failure) {
    if (failure.runtimeType is ServerFailure) {
      return AppStrings.serverFailure;
    } else {
      return AppStrings.cacheFailure;
    }
  }
}
