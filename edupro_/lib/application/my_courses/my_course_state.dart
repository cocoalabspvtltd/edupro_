part of 'my_course_bloc.dart';

@freezed
class MyCourseState with _$MyCourseState {
  const factory MyCourseState({
    required String videoUrl,
    required bool isVideoLoading,
    required bool isFetchingData,
    required bool isSubmitting,
    required String questionTitle,
    required String questionSubject,
    required String answer,
    required Option<Either<NetworkFailure, dynamic>> loadFailureOrSuccessOption,
    required Option<Either<NetworkFailure, dynamic>>
        submitFailureOrSuccessOption,
  }) = _MyCourseState;

  factory MyCourseState.initial() => MyCourseState(
        videoUrl: '',
        isVideoLoading: true,
        isFetchingData: false,
        isSubmitting: false,
        questionTitle: '',
        questionSubject: '',
        answer: '',
        loadFailureOrSuccessOption: none(),
        submitFailureOrSuccessOption: none(),
      );
}
