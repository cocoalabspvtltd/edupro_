part of 'live_videos_bloc_bloc.dart';

@freezed
class LiveVideosEvent with _$LiveVideosEvent {
  const factory LiveVideosEvent.loadVideos() = _LoadVideos;
  const factory LiveVideosEvent.loadMoreVideos() = _LoadMoreVideos;
  const factory LiveVideosEvent.refreshVideos() = _RefreshVideos;
}
