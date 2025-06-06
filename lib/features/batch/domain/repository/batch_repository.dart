// interface indicates that this class only defines method signatures, not implementations.
// decouples the domain layer from the data layer.
// specifies the contract that any data layer implementation must fulfill.

import 'package:dartz/dartz.dart';
import 'package:student_management/core/error/failure.dart';
import 'package:student_management/features/batch/domain/entity/batch_entity.dart';

abstract interface class IBatchRepository {
  // here add I in className to indicate interface
  Future<Either<Failure, List<BatchEntity>>> getAllBatches();
  Future<Either<Failure, void>> createBatch(BatchEntity batch);
  Future<Either<Failure, void>> deleteBatch(String batchId);
}
