part of 'insiistution_student_bloc.dart';

@freezed
class InsiistutionStudentState with _$InsiistutionStudentState {

  const factory InsiistutionStudentState({

    required TextEditingController name,
    required TextEditingController email,
    required TextEditingController mobile,
    required TextEditingController addtionalmobile,
    required String course,
    required String department,
    required TextEditingController address,
    required File? displayPicture,
    required TextEditingController dob,
    required bool showErrorMessages,
    required bool isLoading,
    required bool isSubmitting,
    required Option<Either<NetworkFailure, Unit>>
    loadFailureOrSuccessOption,
    required Option<Either<NetworkFailure, Unit>>
    submitFailedOrSuccessOption,

  }) = _InsiistutionStudentState;
  factory InsiistutionStudentState.initial() => InsiistutionStudentState(

    name: TextEditingController(),
    mobile: TextEditingController(),
    email: TextEditingController(),
    addtionalmobile: TextEditingController(),
    course: categoryaName,
    department:departmentName,
    displayPicture: null,
address: TextEditingController(),
dob: TextEditingController(),
    showErrorMessages: false,
    isSubmitting: false,
    isLoading: false,
    loadFailureOrSuccessOption: none(),
    submitFailedOrSuccessOption: none(),
  );

}

