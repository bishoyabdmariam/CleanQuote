import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quotemaker/Core/api/api_consumer.dart';
import 'package:quotemaker/Core/api/app_interceptor.dart';
import 'package:quotemaker/Core/api/dio_consumer.dart';
import 'package:quotemaker/Core/network/network_info.dart';
import 'package:quotemaker/Features/random_quote/data/data_sources/random_quote_remote_data_sources.dart';
import 'package:quotemaker/Features/random_quote/data/repositories/random_quote_repositories_imp.dart';
import 'package:quotemaker/Features/random_quote/domain/repositories/random_quote_repositories.dart';
import 'package:quotemaker/Features/random_quote/domain/use_cases/get_random_quote.dart';
import 'package:quotemaker/Features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:quotemaker/Features/splash/data/data_sources/lang_local_data_sources.dart';
import 'package:quotemaker/Features/splash/data/repositories/lang_repositories_imp.dart';
import 'package:quotemaker/Features/splash/domain/repositories/lang_repositories.dart';
import 'package:quotemaker/Features/splash/domain/use_cases/change_locale.dart';
import 'package:quotemaker/Features/splash/domain/use_cases/get_saved_lang.dart';
import 'package:quotemaker/Features/splash/presentation/cubit/locale_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'Features/random_quote/data/data_sources/random_quote_local_data_sources.dart';

final sl = GetIt.I;

Future<void> init() async {
  //   Features

  //    Blocs
  sl.registerFactory<RandomQuoteCubit>(
      () => RandomQuoteCubit(getRandomQuoteUseCase: sl()));
  sl.registerFactory<LocaleCubit>(
      () => LocaleCubit(getSavedLangUseCase: sl(), changeLangUseCase: sl()));

  //    UseCases
  sl.registerLazySingleton(() => GetRandomQuote(randomQuoteRepositories: sl()));
  sl.registerLazySingleton(() => GetSavedLangUseCase(langRepository: sl()));
  sl.registerLazySingleton(() => ChangeLangUseCase(langRepository: sl()));

  //    Repository
  sl.registerLazySingleton<RandomQuoteRepositories>(
    () => RandomQuoteRepositoriesImp(
      networkInfo: sl(),
      randomQuoteRemoteDataSource: sl(),
      randomQuoteLocalDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<LangRepository>(
      () => LangRepositoriesImp(langLocalDataSource: sl()));

  // Data Sources
  sl.registerLazySingleton<RandomQuoteRemoteDataSource>(
    () => RandomQuoteRemoteDataSourceImpl(
      apiConsumer: sl(),
    ),
  );

  sl.registerLazySingleton<RandomQuoteLocalDataSource>(
    () => RandomQuoteLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );
  sl.registerLazySingleton<LangLocalDataSource>(
    () => LangLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );

  //   Core
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()));

  //   External
  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton(
    () => sharedPreferences,
  );

  sl.registerLazySingleton(() => Dio());

  sl.registerLazySingleton(() => InternetConnectionChecker());

  sl.registerLazySingleton(() => AppInterceptors());

  sl.registerLazySingleton(
    () => LogInterceptor(
      request: true,
      error: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ),
  );
}
