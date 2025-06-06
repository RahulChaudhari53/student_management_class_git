import 'package:dartz/dartz.dart';
import 'package:student_management/core/error/failure.dart';

// SuccessType is a generic type

abstract interface class UseCaseWithParams<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}
// this is so that we can pass parameter in the two functions
// this id for two functions with parameters in

abstract interface class UseCaseWithoutParams<SuccessType> {
  Future<Either<Failure, SuccessType>> call();
}
