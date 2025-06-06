//  defines how your app talks to your database (Hive) to fetch, save, and delete batches.
// It acts as an interface so you can have multiple implementations later (for example, one that talks 
// to an API or one that uses SQLite).
import 'package:student_management/features/batch/domain/entity/batch_entity.dart';

abstract interface class IBatchDataSource {
  Future<List<BatchEntity>> getAllBatches();
  Future<void> createBatch(BatchEntity entity);
  Future<void> deleteBatch(String id);
}
