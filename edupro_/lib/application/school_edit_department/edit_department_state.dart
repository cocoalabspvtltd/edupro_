part of 'edit_department_bloc.dart';

@freezed
class EditDepartmentState with _$EditDepartmentState {
  const factory EditDepartmentState({
    required Name name,
    required bool showErrorMessages,
    required bool isLoading,
    required bool isSubmitting,
    required TextEditingController nameController,
    required Option<Either<NetworkFailure, AddDepartmentResponse>>
    loadFailureOrSuccessOption,
    required Option<Either<NetworkFailure, AddDepartmentResponse>>
    submitFailedOrSuccessOption,
  }) = _EditDepartmentState;
  factory EditDepartmentState.initial() => EditDepartmentState(
    name: Name(''),
    showErrorMessages: false,
    isLoading: false,
    isSubmitting: false,
    loadFailureOrSuccessOption: none(),
    submitFailedOrSuccessOption: none(),
    nameController: TextEditingController(),
  );
}
