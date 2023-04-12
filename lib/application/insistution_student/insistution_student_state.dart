part of 'institution_instructor_bloc.dart';
String categoryaName = "";
@freezed
class InstitutionInstructorState with _$InstitutionInstructorState {
  const factory InstitutionInstructorState({

    required TextEditingController name,
    required TextEditingController mobile,
    required TextEditingController addtionalmobile,
    required String category,
    required TextEditingController qualification,
    required File? displayPicture,
    required TextEditingController description,
    required TextEditingController email,
    required TextEditingController password,
    required bool showErrorMessages,
    required bool isLoading,
    required bool isSubmitting,
    required Option<Either<NetworkFailure, Unit>>
    loadFailureOrSuccessOption,
    required Option<Either<NetworkFailure, Unit>>
    submitFailedOrSuccessOption,

  }) = _InstitutionInstructorState;

  factory InstitutionInstructorState.initial() => InstitutionInstructorState(

    name: TextEditingController(),
    mobile: TextEditingController(),
    category: categoryaName,
    addtionalmobile: TextEditingController(),
    email: TextEditingController(),
    password: TextEditingController(),
    qualification :TextEditingController(),
    displayPicture: null,
    description: TextEditingController(),
    showErrorMessages: false,
    isSubmitting: false,
    isLoading: false,
    loadFailureOrSuccessOption: none(),
    submitFailedOrSuccessOption: none(),
  );
}
