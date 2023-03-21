class MyCourseVideosResponse {
  MyCourseVideosResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.myCourseVideoData,
  });
  late final bool status;
  late final int statusCode;
  late final String message;
  late final List<MyCourseVideoData>? myCourseVideoData;

  MyCourseVideosResponse.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    statusCode = json['status_code'];
    // message = json['message'];
    myCourseVideoData = List.from(json['my_course_video_data'])
        .map((e) => MyCourseVideoData.fromJson(e))
        .toList();
  }
}

class MyCourseVideoData {
  MyCourseVideoData({
    required this.videoTitle,
    required this.videoUrl,
    required this.videoEmbededUrl,
    required this.videoDuration,
  });
  late final String? videoTitle;
  late final String? videoUrl;
  late final String? videoEmbededUrl;
  late final String? videoDuration;

  MyCourseVideoData.fromJson(Map<String, dynamic> json) {
    videoTitle = json['video_title'];
    videoUrl = json['video_url'];
    videoEmbededUrl = json['video_embeded_url'];
    videoDuration = json['video_duration'];
  }
}
