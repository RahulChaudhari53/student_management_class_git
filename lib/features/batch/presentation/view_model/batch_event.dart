import 'package:equatable/equatable.dart';

class BatchEvent extends Equatable {
  const BatchEvent();
  @override
  List<Object?> get props => [];
}

class LoadBatches extends BatchEvent {}

class AddBatch extends BatchEvent {
  final String batchName;

  const AddBatch(this.batchName);

  @override
  List<Object?> get props => [batchName];
}

class DeleteBatch extends BatchEvent {
  final String batchId;

  const DeleteBatch(this.batchId);

  @override
  List<Object?> get props => [batchId];
}
