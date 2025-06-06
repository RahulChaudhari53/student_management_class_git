import 'package:equatable/equatable.dart';
import 'package:student_management/features/batch/domain/entity/batch_entity.dart';

class BatchState extends Equatable {
  final List<BatchEntity> batchList;
  final bool isLoading;
  final String? error;

  const BatchState({
    required this.batchList,
    required this.isLoading,
    this.error,
  });

  factory BatchState.initial() {
    return BatchState(batchList: [], isLoading: false);
  }

  BatchState copyWith({
    List<BatchEntity>? batchList,
    bool? isLoading,
    String? error,
  }) {
    return BatchState(
      batchList: batchList ?? this.batchList,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
