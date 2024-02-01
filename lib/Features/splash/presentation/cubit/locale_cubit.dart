import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotemaker/Core/utils/app_strings.dart';
import 'package:quotemaker/Features/splash/domain/use_cases/change_locale.dart';
import 'package:quotemaker/core/usecases/usecase.dart';

import '../../domain/use_cases/get_saved_lang.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  final GetSavedLangUseCase getSavedLangUseCase;
  final ChangeLangUseCase changeLangUseCase;

  LocaleCubit(
      {required this.changeLangUseCase, required this.getSavedLangUseCase})
      : super( const ChangeLocaleState(locale: Locale(AppStrings.englishCode)));

  String currentLangCode = AppStrings.englishCode;

  Future<void> getSavedLang() async {
    emit(LocaleStateLoading(locale: Locale(currentLangCode)));
    final response = await getSavedLangUseCase.call(NoParams());
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentLangCode = value;
      emit(ChangeLocaleState(locale: Locale(currentLangCode)));
    });
  }

  Future<void> _changeLang(String langCode) async {
    emit(LocaleStateLoading(locale: Locale(currentLangCode)));
    final response = await changeLangUseCase.call(langCode);
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentLangCode = langCode;
      emit(ChangeLocaleState(locale:Locale(langCode)));
    });
  }

  void toEnglish() {
    _changeLang(AppStrings.englishCode);
  }

  void toArabic() {
    _changeLang(AppStrings.arabicCode);
  }
}
