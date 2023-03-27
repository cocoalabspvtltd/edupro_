part of 'instructor_bloc.dart';

@freezed
class InstructorState with _$InstructorState {
  const factory InstructorState({

    required String title,
    required String aboutTitle,
    required String category,
    required String amount,
    required String duration,
    required String url,
    required File? displayPicture,
    required String description,
    required String whatYouLearn,
    required String areThere,
    required String whoIsThis,
    required bool showErrorMessages,
    required bool isLoading,
    required bool isSubmitting,
    required Option<Either<NetworkFailure, Unit>>
    loadFailureOrSuccessOption,
    required Option<Either<NetworkFailure, Unit>>
    submitFailedOrSuccessOption,

  }) = _InstructorState;

   factory InstructorState.initial() => InstructorState(
     title: "",
     aboutTitle: "",
     category: "",
     amount: "",
     duration: "",
     url: "",
     displayPicture: null,
     description: "",
     whatYouLearn: "",
     areThere: "",
     whoIsThis: "",
     showErrorMessages: false,
     isSubmitting: false,
     isLoading: false,
     loadFailureOrSuccessOption: none(),
     submitFailedOrSuccessOption: none(),


   );
}
