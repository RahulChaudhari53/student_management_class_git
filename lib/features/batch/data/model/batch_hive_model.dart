// interacts with hive database to store and retrieve batches
// responsible for saving/loading data via @HiveType and @HiveField

// define data model for hive storage
// map between Hive and domain (BatchEntity)
//
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_management/app/constant/hive_table_constant.dart';
import 'package:student_management/features/batch/domain/entity/batch_entity.dart';
import 'package:uuid/uuid.dart';

part 'batch_hive_model.g.dart';
//  dart run build_runner build -d

@HiveType(typeId: HiveTableConstant.batchTableId)
class BatchHiveModel extends Equatable {
  @HiveField(0)
  final String? batchId;
  @HiveField(1)
  final String batchName;

  BatchHiveModel({String? batchId, required this.batchName}) // constructor
    : batchId = batchId ?? const Uuid().v4();

  // Initial Constructor // like for initialization in UI
  const BatchHiveModel.initial() : batchId = '', batchName = '';

  // From Entity : converts a domain entity to a Hive Model
  factory BatchHiveModel.fromEntity(BatchEntity entity) {
    return BatchHiveModel(batchId: entity.batchId, batchName: entity.batchName);
  }

  // To Entity : converts a Hive model back to the domain entity for use in the domain layer
  BatchEntity toEntity() {
    return BatchEntity(batchId: batchId, batchName: batchName);
  }

  // from Entity List : converts a list of Batch Entities to a list of Hive Models
  static List<BatchHiveModel> fromEntityList(List<BatchEntity> entityList) {
    return entityList
        .map((entity) => BatchHiveModel.fromEntity(entity))
        .toList();
  }

  // to Entity List : converts a list of list of Hive Models to a list of Batch Entities
  static List<BatchEntity> toEntityList(List<BatchHiveModel> modelList) {
    return modelList.map((model) => model.toEntity()).toList();
  }

  @override
  List<Object?> get props => [batchId, batchName];
}
