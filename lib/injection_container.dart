import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quotemaker/Core/api/app_interceptor.dart';
import 'package:quotemaker/Core/network/network_info.dart';
import 'package:quotemaker/Features/random_quote/data/data_sources/random_quote_remote_data_sources.dart';
import 'package:quotemaker/Features/random_quote/data/repositories/random_quote_repositories_imp.dart';
import 'package:quotemaker/Features/random_quote/domain/repositories/random_quote_repositories.dart';
import 'package:quotemaker/Features/random_quote/domain/use_cases/get_random_quote.dart';
import 'package:quotemaker/Features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'Features/random_quote/data/data_sources/random_quote_local_data_sources.dart';

final sl = GetIt.I;

Future<void> init() async {
  //   Features
  //    Blocs

  sl.registerFactory(() => RandomQuoteCubit(getRandomQuoteUseCase: sl()));

  //    UseCases

  sl.registerLazySingleton(() => GetRandomQuote(randomQuoteRepositories: sl()));

  //    Repository

  sl.registerLazySingleton<RandomQuoteRepositories>(
    () => RandomQuoteRepositoriesImp(
      networkInfo: sl(),
      randomQuoteRemoteDataSource: sl(),
      randomQuoteLocalDataSource: sl(),
    ),
  );

  // Data Sources

  sl.registerLazySingleton<RandomQuoteRemoteDataSource>(
    () => RandomQuoteRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<RandomQuoteLocalDataSource>(
    () => RandomQuoteLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );

  //   Core

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()));

  //   External

  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton(
    () => sharedPreferences,
  );

  sl.registerLazySingleton(() => http.Client());

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
