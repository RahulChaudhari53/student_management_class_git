import 'package:dartz/dartz.dart';
import 'package:student_management/app/use_case/usecase.dart';
import 'package:student_management/core/error/failure.dart';
import 'package:student_management/features/batch/domain/repository/batch_repository.dart';

class GetAllBatchesUseCase implements UseCaseWithoutParams {
  final IBatchRepository iBatchRepository;
  const GetAllBatchesUseCase({required this.iBatchRepository});

  @override
  Future<Either<Failure, dynamic>> call() async {
    return await iBatchRepository.getAllBatches();
  }
}
