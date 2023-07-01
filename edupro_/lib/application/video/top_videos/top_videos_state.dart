part of 'top_videos_bloc.dart';

@freezed
class TopVideosState with _$TopVideosState {
  const factory TopVideosState.initial() = Initial;
  const factory TopVideosState.loadInProgress() = DataTransferInProgress;
  const factory TopVideosState.loadMoreInProgress() = LoadMoreInProgress;
  const factory TopVideosState.loadSuccess(VideoResponse videoResponse) =
      LoadSuccess;
  const factory TopVideosState.loadFailure(VideoFailure videoFailure) =
      LoadFailure;
}
