class AddClassesResponse {
  bool? success;
  int? statusCode;
  Class? classes;
  String? message;

  AddClassesResponse({this.success, this.statusCode, this.classes, this.message});

  AddClassesResponse.fromJson(Map<String, dynamic> json) {
  success = json['success'];
  statusCode = json['status_code'];
  classes = json['class'] != null ? new Class.fromJson(json['class']) : null;
  message = json['message'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['success'] = this.success;
  data['status_code'] = this.statusCode;
  if (this.classes != null) {
  data['class'] = this.classes!.toJson();
  }
  data['message'] = this.message;
  return data;
  }
}

class Class {
  String? videoTitle;
  String? videoUrl;
  String? videoEmbadedUrl;
  String? videoDuration;
  String? department;
  String? course;
  String? instructorName;
  String? instituteName;
  String? videoThumbnail;
  String? updatedAt;
  String? createdAt;
  int? id;

  Class({this.videoTitle, this.videoUrl, this.videoEmbadedUrl, this.videoDuration, this.department, this.course, this.instructorName, this.instituteName, this.videoThumbnail, this.updatedAt, this.createdAt, this.id});

  Class.fromJson(Map<String, dynamic> json) {
    videoTitle = json['video_title'];
    videoUrl = json['video_url'];
    videoEmbadedUrl = json['video_embaded_url'];
    videoDuration = json['video_duration'];
    department = json['department'];
    course = json['course'];
    instructorName = json['instructor_name'];
    instituteName = json['institute_name'];
    videoThumbnail = json['video_thumbnail'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['video_title'] = this.videoTitle;
    data['video_url'] = this.videoUrl;
    data['video_embaded_url'] = this.videoEmbadedUrl;
    data['video_duration'] = this.videoDuration;
    data['department'] = this.department;
    data['course'] = this.course;
    data['instructor_name'] = this.instructorName;
    data['institute_name'] = this.instituteName;
    data['video_thumbnail'] = this.videoThumbnail;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}