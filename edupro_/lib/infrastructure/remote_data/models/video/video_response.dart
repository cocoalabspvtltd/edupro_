class VideoResponse {
  List<Video>? video;
  String? message;
  bool? status;

  VideoResponse({this.video, this.message, this.status});

  VideoResponse.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      video = <Video>[];
      json['list'].forEach((v) {
        video!.add(Video.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }
}

class Video {
  int? id;
  String? title;
  String? description;
  String? meetingId;
  String? meetingLink;
  String? videoUrl;
  String? category;
  int? amount;
  String? status;
  String? passCode;
  String? videoThumbnail;
  String? createdAt;
  String? updatedAt;

  Video(
      {this.id,
      this.title,
      this.description,
      this.meetingId,
      this.meetingLink,
      this.videoUrl,
      this.category,
      this.amount,
      this.status,
      this.passCode,
      this.videoThumbnail,
      this.createdAt,
      this.updatedAt});

  Video.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    meetingId = json['meeting_id'];
    meetingLink = json['meeting_link'];
    videoUrl = json['url'];
    category = json['category'];
    amount = json['amount'];
    status = json['status'];
    passCode = json['pass_code'];
    videoThumbnail = json['video_thumbnail'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
