// real-life object that is INDEPENDENT of data and presentation.
// INDEPENDENT from data frameworks (Hive, Firebase, etc.).

import 'package:equatable/equatable.dart';

class BatchEntity extends Equatable {
  final String? batchId;
  final String batchName;

  const BatchEntity({this.batchId, required this.batchName});

  @override
  List<Object?> get props => [batchId, batchName]; // which fields to look at while comparing two BatchEntity
}
