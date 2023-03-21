part of 'trending_videos_bloc.dart';

@freezed
class TrendingVideosEvent with _$TrendingVideosEvent {
  const factory TrendingVideosEvent.loadVideos() = _LoadVideos;
  const factory TrendingVideosEvent.loadMoreVideos() = _LoadMoreVideos;
  const factory TrendingVideosEvent.refreshVideos() = _RefreshVideos;
}
