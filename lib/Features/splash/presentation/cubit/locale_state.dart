part of 'locale_cubit.dart';

@immutable
abstract class LocaleState extends Equatable {
  final Locale locale;

  const LocaleState({required this.locale});

  @override
  List<Object?> get props => [];
}

class ChangeLocaleState extends LocaleState {
  @override
  final Locale locale;

  const ChangeLocaleState({required this.locale}) : super(locale: locale);
}

class LocaleStateLoading extends LocaleState {
  const LocaleStateLoading({required super.locale});
}
