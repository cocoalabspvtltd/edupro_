import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pgs_edupro/domain/core/network/api_provider.dart';
import 'package:pgs_edupro/domain/video/i_video_repository.dart';
import 'package:pgs_edupro/domain/video/video_failure.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/video/video_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/source/api.dart';

class VideoRepository implements IVideoRepository {
  ApiProvider? apiClient;

  VideoRepository() {
    apiClient ??= ApiProvider();
  }

  @override
  Future<Either<VideoFailure, VideoResponse>> getTrendingVideos(
      Map body) async {
    try {
      Response response =
          await apiClient!.getJsonInstance().get(Api.getTrendingVideos);

      return right(VideoResponse.fromJson(response.data));
    } catch (e) {
      if (e.toString().contains('Http status error [302]')) {
        return left(const VideoFailure.serverError("Status Code 302"));
      } else if (e.toString().contains('Http status error [404]')) {
        return left(const VideoFailure.serverError("Error Code 404"));
      } else if (e.toString().contains('Connecting timed out')) {
        return left(const VideoFailure.serverTimeOut());
      }
      return left(const VideoFailure.unexpected());
    }
  }

  @override
  Future<Either<VideoFailure, VideoResponse>> getLiveVideos(Map body) async {
    try {
      Response response =
          await apiClient!.getJsonInstance().get(Api.getLiveVideos);

      return right(VideoResponse.fromJson(response.data));
    } catch (e) {
      if (e.toString().contains('Http status error [302]')) {
        return left(const VideoFailure.serverError("Error Code 302"));
      } else if (e.toString().contains('Http status error [404]')) {
        return left(const VideoFailure.serverError("Error Code 404"));
      } else if (e.toString().contains('Connecting timed out')) {
        return left(const VideoFailure.serverTimeOut());
      }
      log(e.runtimeType.toString());
      log(e.toString());
      return left(const VideoFailure.unexpected());
    }
  }

  @override
  Future<Either<VideoFailure, VideoResponse>> getTopVideos(Map body) async {
    try {
      Response response =
          await apiClient!.getJsonInstance().get(Api.getTopVideos);

      return right(VideoResponse.fromJson(response.data));
    } catch (e) {
      if (e.toString().contains('Http status error [302]')) {
        return left(const VideoFailure.serverError("Error Code 302"));
      } else if (e.toString().contains('Http status error [404]')) {
        return left(const VideoFailure.serverError("Error Code 404"));
      } else if (e.toString().contains('Connecting timed out')) {
        return left(const VideoFailure.serverTimeOut());
      }
      return left(const VideoFailure.unexpected());
    }
  }
}
