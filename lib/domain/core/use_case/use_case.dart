import 'package:dartz/dartz.dart';
import 'package:weather_app/domain/core/entities/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}