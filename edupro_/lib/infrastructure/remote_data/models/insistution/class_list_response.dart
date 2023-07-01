class ClassListResponse {
  bool? success;
  int? statusCode;
  String? message;
  List<ClassList>? classList;

  ClassListResponse(
      {this.success, this.statusCode, this.message, this.classList});

  ClassListResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    if (json['classList'] != null) {
      classList = <ClassList>[];
      json['classList'].forEach((v) {
        classList!.add(new ClassList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.classList != null) {
      data['classList'] = this.classList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClassList {
  int? id;
  String? videoTitle;
  String? videoUrl;
  String? videoEmbadedUrl;
  String? videoDuration;
  String? department;
  String? course;
  String? instructorName;
  String? instituteName;
  String? videoThumbnail;
  String? createdAt;
  String? updatedAt;

  ClassList(
      {this.id,
        this.videoTitle,
        this.videoUrl,
        this.videoEmbadedUrl,
        this.videoDuration,
        this.department,
        this.course,
        this.instructorName,
        this.instituteName,
        this.videoThumbnail,
        this.createdAt,
        this.updatedAt});

  ClassList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    videoTitle = json['video_title'];
    videoUrl = json['video_url'];
    videoEmbadedUrl = json['video_embaded_url'];
    videoDuration = json['video_duration'];
    department = json['department'];
    course = json['course'];
    instructorName = json['instructor_name'];
    instituteName = json['institute_name'];
    videoThumbnail = json['video_thumbnail'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['video_title'] = this.videoTitle;
    data['video_url'] = this.videoUrl;
    data['video_embaded_url'] = this.videoEmbadedUrl;
    data['video_duration'] = this.videoDuration;
    data['department'] = this.department;
    data['course'] = this.course;
    data['instructor_name'] = this.instructorName;
    data['institute_name'] = this.instituteName;
    data['video_thumbnail'] = this.videoThumbnail;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}