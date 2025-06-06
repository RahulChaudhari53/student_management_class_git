// Implements the IBatchDataSource contract.
// Uses the HiveService to perform actual database operations.
// Converts between domain entities (BatchEntity) and data models (BatchHiveModel).

import 'package:student_management/core/network/hive_service.dart';
import 'package:student_management/features/batch/data/data_source/batch_data_source.dart';
import 'package:student_management/features/batch/data/model/batch_hive_model.dart';
import 'package:student_management/features/batch/domain/entity/batch_entity.dart';

class BatchLocalDataSource implements IBatchDataSource {
  final HiveService hiveService;

  BatchLocalDataSource(this.hiveService);

  @override
  Future<void> createBatch(BatchEntity batch) async {
    try {
      await hiveService.createBatch(BatchHiveModel.fromEntity(batch));
    } catch (e) {
      throw Exception("failed to add batch: $e");
    }
  }

  @override
  Future<void> deleteBatch(String batchId) async {
    try {
      await hiveService.deleteBatch(batchId);
    } catch (e) {
      throw Exception("failed to delete batch: $e");
    }
  }

  // @override
  // Future<List<BatchEntity>> getAllBatches() async {
  //   try {
  //     final List<BatchHiveModel> batchModels = await hiveService
  //         .getAllBatches();
  //     final List<BatchEntity> batches = batchModels
  //         .map((model) => model.toEntity())
  //         .toList();
  //     return batches;
  //   } catch (e) {
  //     throw Exception("failed to get batch list: $e");
  //   }
  // }

  // above or below for getAllBatches

  @override
  Future<List<BatchEntity>> getAllBatches() async {
    try {
      final batchModels = await hiveService.getAllBatches();
      return BatchHiveModel.toEntityList(batchModels);
    } catch (e) {
      throw Exception("failed to get batch list: $e");
    }
  }
}
