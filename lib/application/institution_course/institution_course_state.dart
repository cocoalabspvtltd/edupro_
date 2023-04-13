part of 'institution_course_bloc.dart';

@freezed
class InstitutionCourseState with _$InstitutionCourseState {
  const factory InstitutionCourseState({

    required TextEditingController title,
    required TextEditingController aboutTitle,
    required String category,
    required String instructor,
    required TextEditingController amount,
    required TextEditingController duration,
    required TextEditingController url,
    required File? displayPicture,
    required TextEditingController description,
    required TextEditingController whatYouLearn,
    required TextEditingController areThere,
    required TextEditingController whoIsThis,
    required bool showErrorMessages,
    required bool isLoading,
    required bool isSubmitting,
    required Option<Either<NetworkFailure, Unit>>
    loadFailureOrSuccessOption,
    required Option<Either<NetworkFailure, Unit>>
    submitFailedOrSuccessOption,

  }) = _InstitutionCourseState;
  factory InstitutionCourseState.initial() => InstitutionCourseState(
    title: TextEditingController(),
    aboutTitle: TextEditingController(),
    category: categoryaName,
    instructor: instructorName,
    amount: TextEditingController(),
    duration: TextEditingController(),
    url: TextEditingController(),
    displayPicture: null,
    description: TextEditingController(),
    whatYouLearn: TextEditingController(),
    areThere: TextEditingController(),
    whoIsThis: TextEditingController(),
    showErrorMessages: false,
    isSubmitting: false,
    isLoading: false,
    loadFailureOrSuccessOption: none(),
    submitFailedOrSuccessOption: none(),


  );
}
