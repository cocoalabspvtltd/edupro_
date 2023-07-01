import 'package:dartz/dartz.dart';
import 'package:pgs_edupro/domain/video/i_video_repository.dart';
import 'package:pgs_edupro/domain/video/video_failure.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/video/video_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_videos_event.dart';
part 'top_videos_state.dart';
part 'top_videos_bloc.freezed.dart';

class TopVideosBloc extends Bloc<TopVideosEvent, TopVideosState> {
  final IVideoRepository videoRepository;
  TopVideosBloc(this.videoRepository) : super(const Initial()) {
    on<TopVideosEvent>((event, emit) async {
      if (event is _LoadVideos) {
        emit(const TopVideosState.loadInProgress());
        Either<VideoFailure, VideoResponse>? failureOrSuccess;

        failureOrSuccess = await videoRepository.getTopVideos({'user_id': 2});

        failureOrSuccess.fold((l) => emit(TopVideosState.loadFailure(l)),
            (r) => emit(TopVideosState.loadSuccess(r)));
      }
    });
  }
}
