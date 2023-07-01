import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/youtube_info_response.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeThumpnail {
  Future<String> getYoutubeVideoThumbnail(String url) async {
    String? videoId = YoutubePlayer.convertUrlToId(url);
    try {
      BaseOptions options;
      options = BaseOptions(
        baseUrl: '',
      );

      Dio dio = Dio(options);

      String link =
          'https://www.youtube.com/oembed?url=https://www.youtube.com/watch?v=$videoId&format=json';
      log(link);
      Response response = await dio.get(link);
      YoutubeInfoResponse res = YoutubeInfoResponse.fromJson(response.data);
      log('thumb url:${res.thumbnailUrl ?? ''}');

      return res.thumbnailUrl ?? '';
    } catch (error, s) {
      Completer().completeError(error, s);
    }
    return '';
  }

  String youtubeVideoID(String url) {
    String videoId = '';

    if (url.contains('&')) {
      url = url.substring(1, url.indexOf('&'));
    }

    if (url.contains('?v=')) {
      videoId = url.substring((url.indexOf('?v=') + 3));
    }

    if (videoId.isEmpty) {
      if (url.contains("youtu.be/")) {
        String spl = url.split("youtu.be/")[1];
        if (spl.contains("?")) {
          videoId = spl.split("?")[0];
        } else {
          videoId = spl;
        }
      }
    }

    return videoId;
  }
}
