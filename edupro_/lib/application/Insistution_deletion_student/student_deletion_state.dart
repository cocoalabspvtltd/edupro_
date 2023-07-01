part of 'student_deletion_bloc.dart';

@freezed
class StudentDeletionState with _$StudentDeletionState {
  const factory StudentDeletionState.initial() = _Initial;
  const factory StudentDeletionState({

    required bool showErrorMessages,
    required bool isLoading,
    required bool isSubmitting,

  }) = _StudentDeletionState;
}
