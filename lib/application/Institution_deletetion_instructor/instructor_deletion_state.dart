part of 'instructor_deletion_bloc.dart';

@freezed
class InstructorDeletionState with _$InstructorDeletionState {
  const factory InstructorDeletionState.initial() = _Initial;
  const factory InstructorDeletionState({

    required bool showErrorMessages,
    required bool isLoading,
    required bool isSubmitting,

  }) = _InstructorDeletionState;
}
