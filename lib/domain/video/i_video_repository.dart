import 'package:dartz/dartz.dart';
import 'package:pgs_edupro/domain/video/video_failure.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/video/video_response.dart';

abstract class IVideoRepository {
  Future<Either<VideoFailure, VideoResponse>> getTrendingVideos(Map body);
  Future<Either<VideoFailure, VideoResponse>> getTopVideos(Map body);
  Future<Either<VideoFailure, VideoResponse>> getLiveVideos(Map body);
}
