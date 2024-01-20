import 'package:equatable/equatable.dart';

import '../../domain/entities/quote.dart';

abstract class RandomQuoteState extends Equatable {
  const RandomQuoteState();

  @override
  List<Object?> get props => [];
}

class RandomQuoteStateInitial extends RandomQuoteState {}

class RandomQuoteStateLoading extends RandomQuoteState {}

class RandomQuoteStateSuccess extends RandomQuoteState {
  final Quote quote;

  const RandomQuoteStateSuccess({
    required this.quote,
  });

  @override
  List<Object?> get props => [quote];
}

class RandomQuoteStateFailure extends RandomQuoteState {
  final String msg;

  const RandomQuoteStateFailure({required this.msg});

  @override
  List<Object?> get props => [msg];
}
