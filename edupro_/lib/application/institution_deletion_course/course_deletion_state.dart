part of 'course_deletion_bloc.dart';

@freezed
class CourseDeletionState with _$CourseDeletionState {
  const factory CourseDeletionState.initial() = _Initial;
  const factory CourseDeletionState({

    required bool showErrorMessages,
    required bool isLoading,
    required bool isSubmitting,

  }) = _CourseDeletionState;
}
