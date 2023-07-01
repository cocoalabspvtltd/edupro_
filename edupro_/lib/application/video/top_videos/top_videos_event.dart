part of 'top_videos_bloc.dart';

@freezed
class TopVideosEvent with _$TopVideosEvent {
  const factory TopVideosEvent.loadVideos() = _LoadVideos;
  const factory TopVideosEvent.loadMoreVideos() = _LoadMoreVideos;
  const factory TopVideosEvent.refreshVideos() = _RefreshVideos;
}
