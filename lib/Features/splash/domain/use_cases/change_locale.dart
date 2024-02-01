import 'package:dartz/dartz.dart';
import 'package:quotemaker/Core/error/failures.dart';
import 'package:quotemaker/Core/usecases/usecase.dart';
import 'package:quotemaker/Features/splash/domain/repositories/lang_repositories.dart';

class ChangeLangUseCase implements UseCase<bool, String> {
  final LangRepository langRepository;

  ChangeLangUseCase({required this.langRepository});

  @override
  Future<Either<Failure, bool>> call(String langCode) async {
    return await langRepository.changeLang(langCode: langCode);
  }
}
