import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_management/features/batch/domain/use_case/create_batch_use_case.dart';
import 'package:student_management/features/batch/domain/use_case/delete_batch_use_case.dart';
import 'package:student_management/features/batch/domain/use_case/get_all_batch_use_case.dart';
import 'package:student_management/features/batch/presentation/view_model/batch_event.dart';
import 'package:student_management/features/batch/presentation/view_model/batch_state.dart';

class BatchBloc extends Bloc<BatchEvent, BatchState> {
  final CreateBatchUseCase _createBatchUseCase;
  final DeleteBatchUseCase _deleteBatchUseCase;
  final GetAllBatchUseCase _getAllBatchUseCase;

  BatchBloc({
    required CreateBatchUseCase createBatchUseCase,
    required DeleteBatchUseCase deleteBatchUseCase,
    required GetAllBatchUseCase getAllBatchUseCase,
  }) : _createBatchUseCase = createBatchUseCase,
       _deleteBatchUseCase = deleteBatchUseCase,
       _getAllBatchUseCase = getAllBatchUseCase,
       super(BatchState.initial()) {
    on<LoadBatches>(_onLoadBatches);
    on<AddBatch>(_onCreateBatch);
    on<DeleteBatch>(_onDeleteBatch);

    // Call this event whenever the bloc is created
    add(LoadBatches());
  }

  Future<void> _onLoadBatches(
    LoadBatches event,
    Emitter<BatchState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getAllBatchUseCase.call();
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (batches) => emit(state.copyWith(isLoading: false, batchList: batches)),
    );
  }

  Future<void> _onCreateBatch(AddBatch event, Emitter<BatchState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await _createBatchUseCase.call(
      CreateBatchParams(batchName: event.batchName),
    );
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (_) {
        emit(state.copyWith(isLoading: false, error: null));
        add(LoadBatches());
      },
    );
  }

  Future<void> _onDeleteBatch(
    DeleteBatch event,
    Emitter<BatchState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _deleteBatchUseCase.call(
      DeleteBatchParams(batchId: event.batchId),
    );
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (_) {
        emit(state.copyWith(isLoading: false, error: null));
        add(LoadBatches());
      },
    );
  }
}
