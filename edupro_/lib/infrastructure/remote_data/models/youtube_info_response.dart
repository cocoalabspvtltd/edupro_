class YoutubeInfoResponse {
  String? thumbnailUrl;

  YoutubeInfoResponse({this.thumbnailUrl});

  YoutubeInfoResponse.fromJson(dynamic json) {
    thumbnailUrl = json['thumbnail_url'];
  }
}
