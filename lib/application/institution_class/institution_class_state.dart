part of 'institution_class_bloc.dart';

@freezed
class InstitutionClassState with _$InstitutionClassState {
  const factory InstitutionClassState({

    required TextEditingController title,
    required String course,
    required String instructor,
    required String department,
    required TextEditingController url,
    required TextEditingController duration,
    required File? displayPicture,
    required bool showErrorMessages,
    required bool isLoading,
    required bool isSubmitting,
    required Option<Either<NetworkFailure, Unit>>
    loadFailureOrSuccessOption,
    required Option<Either<NetworkFailure, Unit>>
    submitFailedOrSuccessOption,

  }) = _InstitutionClassState;
  factory InstitutionClassState.initial() => InstitutionClassState(
    title: TextEditingController(),
    course: categoryaName,
    instructor: instructorName,
    department: departmentName,
    duration: TextEditingController(),
    url: TextEditingController(),
    displayPicture: null,
    showErrorMessages: false,
    isSubmitting: false,
    isLoading: false,
    loadFailureOrSuccessOption: none(),
    submitFailedOrSuccessOption: none(),
  );
}
