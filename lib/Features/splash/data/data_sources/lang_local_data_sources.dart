import 'package:dartz/dartz.dart';
import 'package:quotemaker/Core/error/failures.dart';
import 'package:quotemaker/Core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LangLocalDataSource {
  Future<bool> changeLang({required String langCode});

  Future<String?> getSavedLang();
}

class LangLocalDataSourceImpl implements LangLocalDataSource {
  late final SharedPreferences sharedPreferences;

  @override
  Future<bool> changeLang({required String langCode}) async {
    return await sharedPreferences.setString(AppStrings.locale, langCode);
  }

  @override
  Future<String?> getSavedLang() async =>
      sharedPreferences.containsKey(AppStrings.locale)
          ? sharedPreferences.getString(AppStrings.locale)
          : AppStrings.englishCode;
}
