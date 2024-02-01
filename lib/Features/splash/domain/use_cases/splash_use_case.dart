
import '../../../../Core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/splash_model.dart';
import 'package:dartz/dartz.dart';

 class SplashUseCase implements UseCase<SplashModel, NoParams> {
 
     @override
     Future<Either<Failure, SplashModel>> call(NoParams params) {
    // TODO: implement call
     throw UnimplementedError();
     }


}
