import 'package:dartz/dartz.dart';

import 'package:quotemaker/Core/error/failures.dart';
import 'package:quotemaker/Features/splash/data/data_sources/lang_local_data_sources.dart';

import '../../domain/repositories/lang_repositories.dart';

class LangRepositoriesImp extends LangRepository {
  final LangLocalDataSource langLocalDataSource;

  LangRepositoriesImp({required this.langLocalDataSource});

  @override
  Future<Either<Failure, bool>> changeLang({required String langCode}) async {
    try {
      final langIsChanged =
          await langLocalDataSource.changeLang(langCode: langCode);
      return Right(langIsChanged);
    } on Exception {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getSavedLang() async {
    try {
      final langCode = await langLocalDataSource.getSavedLang();
      return Right(langCode!);
    } on Exception {
      return Left(CacheFailure());
    }
  }
}
