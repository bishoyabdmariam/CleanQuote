import 'package:dartz/dartz.dart';

import 'package:quotemaker/Core/error/failures.dart';
import 'package:quotemaker/Features/splash/data/data_sources/lang_local_data_sources.dart';

import '../../domain/repositories/lang_repositories.dart';

class LangRepositoriesImp extends LangRepository {
  final LangLocalDataSource langLocalDataSource;

  LangRepositoriesImp({required this.langLocalDataSource});

  @override
  Future<Either<Failure, bool>> changeLang({required String langCode}) {

  }

  @override
  Future<Either<Failure, String?>> getSavedLang() {
    // TODO: implement getSavedLang
    throw UnimplementedError();
  }
}
