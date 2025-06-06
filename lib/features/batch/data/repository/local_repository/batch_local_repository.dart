//implements the IBatchRepository interface, and connects the domain layer to the data source layer.

import 'package:dartz/dartz.dart';
import 'package:student_management/core/error/failure.dart';
import 'package:student_management/features/batch/data/data_source/local_datasource/batch_local_data_source.dart';
import 'package:student_management/features/batch/domain/entity/batch_entity.dart';
import 'package:student_management/features/batch/domain/repository/batch_repository.dart';

class BatchLocalRepository implements IBatchRepository {
  final BatchLocalDataSource _batchLocalDataSource;

  BatchLocalRepository({required BatchLocalDataSource batchLocalDataSource})
    : _batchLocalDataSource = batchLocalDataSource;

  @override
  Future<Either<Failure, void>> createBatch(BatchEntity batch) async {
    try {
      await _batchLocalDataSource.createBatch(batch);
      return const Right(null);
    } catch (e) {
      return Left(LocalDataBaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteBatch(String batchId) async {
    try {
      await _batchLocalDataSource.deleteBatch(batchId);
      return const Right(null);
    } catch (e) {
      return Left(LocalDataBaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BatchEntity>>> getAllBatches() async {
    try {
      final batches = await _batchLocalDataSource.getAllBatches();
      return Right(batches);
    } catch (e) {
      return Left(LocalDataBaseFailure(message: e.toString()));
    }
  }
}
