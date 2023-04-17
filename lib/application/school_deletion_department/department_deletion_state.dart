part of 'department_deletion_bloc.dart';

@freezed
class DepartmentDeletionState with _$DepartmentDeletionState {
  const factory DepartmentDeletionState.initial() = _Initial;
  const factory DepartmentDeletionState({

    required bool showErrorMessages,
    required bool isLoading,
    required bool isSubmitting,

  }) = _DepartmentDeletionState;
}
