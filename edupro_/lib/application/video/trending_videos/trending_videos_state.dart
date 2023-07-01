part of 'trending_videos_bloc.dart';

@freezed
class TrendingVideosState with _$TrendingVideosState {
  const factory TrendingVideosState.initial() = Initial;
  const factory TrendingVideosState.loadInProgress() = DataTransferInProgress;
  const factory TrendingVideosState.loadMoreInProgress() = LoadMoreInProgress;
  const factory TrendingVideosState.loadSuccess(VideoResponse videoResponse) =
      LoadSuccess;
  const factory TrendingVideosState.loadFailure(VideoFailure videoFailure) =
      LoadFailure;
}
