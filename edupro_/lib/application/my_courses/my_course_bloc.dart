import 'package:dartz/dartz.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/domain/my_course/i_my_course_repository.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/my_course/my_course_videos_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_course_event.dart';
part 'my_course_state.dart';
part 'my_course_bloc.freezed.dart';

class MyCourseBloc extends Bloc<MyCourseEvent, MyCourseState> {
  final IMyCourseRepository myCourseRepository;
  MyCourseBloc(this.myCourseRepository) : super(MyCourseState.initial()) {
    on<_EnterQuestionTitle>(
      (event, emit) => emit(state.copyWith(
        questionTitle: event.questionTitle,
        //loadFailureOrSuccessOption: none(),
        submitFailureOrSuccessOption: none(),
      )),
    );

    on<_EnterQuestionSubject>(
      (event, emit) => emit(state.copyWith(
        questionSubject: event.questionSubject,
        //  loadFailureOrSuccessOption: none(),
        submitFailureOrSuccessOption: none(),
      )),
    );

    on<_EnterAnswer>(
      (event, emit) => emit(state.copyWith(
        answer: event.answer,
        // loadFailureOrSuccessOption: none(),
        submitFailureOrSuccessOption: none(),
      )),
    );

    on<_ChangeVideoTo>(
      (event, emit) async {
        emit(state.copyWith(isVideoLoading: true, videoUrl: event.url));
        await Future.delayed(const Duration(seconds: 1));
        emit(state.copyWith(isVideoLoading: false));
      },
    );

    on<_FetchVideos>((event, emit) async {
      emit(state.copyWith(
        isFetchingData: true,
        loadFailureOrSuccessOption: none(),
      ));

      Either<NetworkFailure, dynamic>? failureOrSuccess;

      failureOrSuccess =
          await myCourseRepository.getMyCourseVideos(event.courseId);

      failureOrSuccess.fold(
        (l) {},
        ((r) async {
          MyCourseVideosResponse response = r;
          if (response.myCourseVideoData?.isNotEmpty ?? false) {
            emit(state.copyWith(
                isVideoLoading: false,
                videoUrl: response.myCourseVideoData?[0].videoUrl ?? ''));
          }
        }),
      );

      emit(state.copyWith(
        isFetchingData: false,
        loadFailureOrSuccessOption: optionOf(failureOrSuccess),
      ));
    });

    on<_FetchAnnouncements>((event, emit) async {
      emit(state.copyWith(
        isFetchingData: true,
        loadFailureOrSuccessOption: none(),
      ));

      Either<NetworkFailure, dynamic>? failureOrSuccess;

      failureOrSuccess =
          await myCourseRepository.getMyCourseAnnouncements(event.courseId);
      //failureOrSuccess.fold((l) {}, ((r) => log("message")));

      emit(state.copyWith(
        isFetchingData: false,
        loadFailureOrSuccessOption: optionOf(failureOrSuccess),
      ));
    });

    on<_FetchQuestions>((event, emit) async {
      emit(state.copyWith(
        isFetchingData: true,
        submitFailureOrSuccessOption: none(),
        loadFailureOrSuccessOption: none(),
      ));

      Either<NetworkFailure, dynamic>? failureOrSuccess;

      failureOrSuccess = await myCourseRepository.getQuestions(event.courseId);
      //failureOrSuccess.fold((l) {}, ((r) => log("message")));

      emit(state.copyWith(
        isFetchingData: false,
        loadFailureOrSuccessOption: optionOf(failureOrSuccess),
      ));
    });

    on<_FetchAnswers>((event, emit) async {
      emit(state.copyWith(
        isFetchingData: true,
        submitFailureOrSuccessOption: none(),
        loadFailureOrSuccessOption: none(),
      ));

      Either<NetworkFailure, dynamic>? failureOrSuccess;

      failureOrSuccess =
          await myCourseRepository.getAnswers(event.courseId, event.questionId);
      //failureOrSuccess.fold((l) {}, ((r) => log("message")));

      emit(state.copyWith(
        isFetchingData: false,
        loadFailureOrSuccessOption: optionOf(failureOrSuccess),
      ));
    });

    on<_AskQuestions>((event, emit) async {
      if (state.questionTitle == '' || state.questionSubject == '') {
        toastMessage("Title and Details cannot be empty");
        return;
      }
      emit(state.copyWith(
        isSubmitting: true,
        submitFailureOrSuccessOption: none(),
        loadFailureOrSuccessOption: none(),
      ));

      Either<NetworkFailure, dynamic>? failureOrSuccess;

      failureOrSuccess = await myCourseRepository.askQuestion(
        event.courseId,
        event.userId,
        state.questionTitle,
        state.questionSubject,
      );
      //failureOrSuccess.fold((l) {}, ((r) => log("message")));
      emit(state.copyWith(
        isSubmitting: false,
        submitFailureOrSuccessOption: optionOf(failureOrSuccess),
      ));
    });

    on<_SubmitAnswer>((event, emit) async {
      emit(state.copyWith(
        isSubmitting: true,
        submitFailureOrSuccessOption: none(),
        // loadFailureOrSuccessOption: none(),
      ));

      Either<NetworkFailure, dynamic>? failureOrSuccess;

      failureOrSuccess = await myCourseRepository.submitAnswer(
        event.courseId,
        event.userId,
        event.questionId,
        state.answer,
      );
      //failureOrSuccess.fold((l) {}, ((r) => log("message")));

      emit(state.copyWith(
        isSubmitting: false,
        submitFailureOrSuccessOption: optionOf(failureOrSuccess),
      ));
    });

    on<_DeleteAnswer>((event, emit) async {
      emit(state.copyWith(
        isSubmitting: true,
        submitFailureOrSuccessOption: none(),
      ));

      Either<NetworkFailure, dynamic>? failureOrSuccess;

      failureOrSuccess = await myCourseRepository.deleteAnswer(
        event.courseId,
        int.parse(UserDetailsLocal.userId),
        event.questionId,
        event.answerId,
      );
      //failureOrSuccess.fold((l) {}, ((r) => log("message")));
      emit(state.copyWith(
        isSubmitting: false,
        submitFailureOrSuccessOption: optionOf(failureOrSuccess),
      ));
    });
  }
}
