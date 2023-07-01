part of 'school_department_bloc.dart';

@freezed
class SchoolDepartmentState with _$SchoolDepartmentState {

  const factory SchoolDepartmentState({

    required TextEditingController name,
    required bool showErrorMessages,
    required bool isLoading,
    required bool isSubmitting,
    required Option<Either<NetworkFailure, Unit>>
    loadFailureOrSuccessOption,
    required Option<Either<NetworkFailure, Unit>>
    submitFailedOrSuccessOption,

  }) = _SchoolDepartmentState;

  factory SchoolDepartmentState.initial() => SchoolDepartmentState(
    name: TextEditingController(),
    showErrorMessages: false,
    isSubmitting: false,
    isLoading: false,
    loadFailureOrSuccessOption: none(),
    submitFailedOrSuccessOption: none(),

  );
}
