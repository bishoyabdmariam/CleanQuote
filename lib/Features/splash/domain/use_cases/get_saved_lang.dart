import 'package:quotemaker/Features/splash/domain/repositories/lang_repositories.dart';

import '../../../../Core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/splash_model.dart';
import 'package:dartz/dartz.dart';

class GetSavedLangUseCase implements UseCase<String, NoParams> {
  final LangRepository langRepository;

  GetSavedLangUseCase({required this.langRepository});

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return await langRepository.getSavedLang();
  }
}
