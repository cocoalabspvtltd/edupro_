import 'package:dartz/dartz.dart';
import 'package:pgs_edupro/domain/video/i_video_repository.dart';
import 'package:pgs_edupro/domain/video/video_failure.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/video/video_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'live_videos_bloc_event.dart';
part 'live_videos_bloc_state.dart';
part 'live_videos_bloc_bloc.freezed.dart';

class LiveVideosBloc extends Bloc<LiveVideosEvent, LiveVideosState> {
  final IVideoRepository videoRepository;
  LiveVideosBloc(this.videoRepository) : super(const Initial()) {
    on<LiveVideosEvent>((event, emit) async {
      if (event is _LoadVideos) {
        emit(const LiveVideosState.loadInProgress());
        Either<VideoFailure, VideoResponse>? failureOrSuccess;

        failureOrSuccess = await videoRepository
            .getLiveVideos({'user_id': UserDetailsLocal.userId});

        failureOrSuccess.fold((l) => emit(LiveVideosState.loadFailure(l)),
            (r) => emit(LiveVideosState.loadSuccess(r)));
      }
    });
  }
}
