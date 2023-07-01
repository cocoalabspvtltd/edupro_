class AddCoursesResponse {
  bool? success;
  int? statusCode;
  String? message;
  CourseDetails? courseDetails;

  AddCoursesResponse(
      {this.success, this.statusCode, this.message, this.courseDetails});

  AddCoursesResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    courseDetails = json['course_details'] != null
        ? new CourseDetails.fromJson(json['course_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.courseDetails != null) {
      data['course_details'] = this.courseDetails!.toJson();
    }
    return data;
  }
}

class CourseDetails {
  String? title;
  String? description;
  String? category;
  String? amount;
  String? institution;
  Instructor? instructor;
  String? aboutTitle;
  String? aboutDescription;
  String? url;
  String? embadedUrl;
  String? duration;
  String? courseThumbnail;
  String? updatedAt;
  String? createdAt;
  int? id;

  CourseDetails(
      {this.title,
        this.description,
        this.category,
        this.amount,
        this.institution,
        this.instructor,
        this.aboutTitle,
        this.aboutDescription,
        this.url,
        this.embadedUrl,
        this.duration,
        this.courseThumbnail,
        this.updatedAt,
        this.createdAt,
        this.id});

  CourseDetails.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    category = json['category'];
    amount = json['amount'];
    institution = json['institution'];
    instructor = json['instructor'] != null
        ? new Instructor.fromJson(json['instructor'])
        : null;
    aboutTitle = json['about_title'];
    aboutDescription = json['about_description'];
    url = json['url'];
    embadedUrl = json['embaded_url'];
    duration = json['duration'];
    courseThumbnail = json['course_thumbnail'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['category'] = this.category;
    data['amount'] = this.amount;
    data['institution'] = this.institution;
    if (this.instructor != null) {
      data['instructor'] = this.instructor!.toJson();
    }
    data['about_title'] = this.aboutTitle;
    data['about_description'] = this.aboutDescription;
    data['url'] = this.url;
    data['embaded_url'] = this.embadedUrl;
    data['duration'] = this.duration;
    data['course_thumbnail'] = this.courseThumbnail;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

class Instructor {
  String? name;

  Instructor({this.name});

  Instructor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}