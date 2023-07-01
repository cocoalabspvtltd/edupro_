part of 'live_videos_bloc_bloc.dart';

@freezed
class LiveVideosState with _$LiveVideosState {
  const factory LiveVideosState.initial() = Initial;
  const factory LiveVideosState.loadInProgress() = DataTransferInProgress;
  const factory LiveVideosState.loadMoreInProgress() = LoadMoreInProgress;
  const factory LiveVideosState.loadSuccess(VideoResponse videoResponse) =
      LoadSuccess;
  const factory LiveVideosState.loadFailure(VideoFailure videoFailure) =
      LoadFailure;
}
