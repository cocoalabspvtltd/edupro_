import 'package:dartz/dartz.dart';
import 'package:pgs_edupro/domain/video/i_video_repository.dart';
import 'package:pgs_edupro/domain/video/video_failure.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/video/video_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'trending_videos_event.dart';
part 'trending_videos_state.dart';
part 'trending_videos_bloc.freezed.dart';

class TrendingVideosBloc
    extends Bloc<TrendingVideosEvent, TrendingVideosState> {
  final IVideoRepository videoRepository;
  TrendingVideosBloc(this.videoRepository) : super(const Initial()) {
    on<TrendingVideosEvent>((event, emit) async {
      if (event is _LoadVideos) {
        emit(const TrendingVideosState.loadInProgress());
        Either<VideoFailure, VideoResponse>? failureOrSuccess;

        failureOrSuccess =
            await videoRepository.getTrendingVideos({'user_id': 2});

        failureOrSuccess.fold((l) => emit(TrendingVideosState.loadFailure(l)),
            (r) => emit(TrendingVideosState.loadSuccess(r)));
      }
    });
  }
}

// if (event is SignInWithEmailAndPasswordPressed) {
//         Either<AuthFailure, UserLogInResponse>? failureOrSuccess;

//         final isEmailValid = state.emailAddress.isValid();
//         final isPasswordValid = state.password.isValid();

//         if (isEmailValid && isPasswordValid) {
//           emit(state.copyWith(
//             isSubmitting: true,
//             authFailureOrSuccessOption: none(),
//           ));

//           failureOrSuccess = await authFacade!.signInWithEmailAndPassword(
//             emailAddress: state.emailAddress,
//             password: state.password,
//           );
//         }

//         emit(state.copyWith(
//           isSubmitting: false,
//           showErrorMessages: true,
//           authFailureOrSuccessOption: optionOf(failureOrSuccess),
//         ));
//       }
