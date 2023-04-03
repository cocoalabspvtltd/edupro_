class MyCoursesResponse {
  MyCoursesResponse({
    required this.status,
    required this.message,
    required this.myCourseData,
  });
  late final bool status;
  late final int statusCode;
  late final String message;
  late final List<MyCourseData>? myCourseData;

  MyCoursesResponse.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    statusCode = json['status_code'];
    //message = json['message'];
    myCourseData = json['my_course_data'] != null
        ? List.from(json['my_course_data'])
            .map((e) => MyCourseData.fromJson(e))
            .toList()
        : null;
  }
}

class MyCourseData {
  MyCourseData({
    required this.courseId,
    required this.title,
    required this.instructors,
    required this.courseCategory,
    required this.courseThumbnail,
    required this.courseDuration,
    required this.aboutCourse,
  });
  late final int? courseId;
  late final String? title;
  late final List<Instructors>? instructors;
  late final String? courseCategory;
  late final String? courseThumbnail;
  late final String? courseDuration;
  late final AboutCourse? aboutCourse;

  MyCourseData.fromJson(Map<String, dynamic> json) {
    courseId = json['course_id'];
    title = json['title'];
    instructors = json['instructors'] != null
        ? List.from(json['instructors'])
            .map((e) => Instructors.fromJson(e))
            .toList()
        : null;
    courseCategory = json['course_category'];
    courseThumbnail = json['course_thumbnail'];
    courseDuration = json['course_duration'];
    aboutCourse = json['about_course'] != null
        ? AboutCourse.fromJson(json['about_course'])
        : null;
  }
}

class Instructors {
  Instructors({
    required this.name,
    required this.displayPicture,
    required this.description,
    required this.qualification,
    required this.instituteName,
  });
  late final String? name;
  late final String? displayPicture;
  late final String? description;
  late final String? qualification;
  late final String? instituteName;

  Instructors.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    displayPicture = json['display_picture'];
    description = json['description'];
    qualification = json['qualification'];
    instituteName = json['institute_name'];
  }
}

class AboutCourse {
  AboutCourse({
    required this.aboutTitle,
    required this.aboutDescription,
  });
  late final String? aboutTitle;
  late final String? aboutDescription;

  AboutCourse.fromJson(Map<String, dynamic> json) {
    aboutTitle = json['about_title'];
    aboutDescription = json['about_description'];
  }
}
class InstructorCourseListResponse {
  bool? success;
  int? statusCode;
  List<Course>? course;

  InstructorCourseListResponse({this.success, this.statusCode, this.course});

  InstructorCourseListResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    if (json['course'] != null) {
      course = <Course>[];
      json['course'].forEach((v) {
        course!.add(new Course.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    if (this.course != null) {
      data['course'] = this.course!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Course {
  int? id;
  String? title;
  String? description;
  String? category;
  String? amount;
  String? institution;
  String? aboutTitle;
  String? aboutDescription;
  String? instructor;
  String? url;
  String? embadedUrl;
  String? duration;
  String? courseThumbnail;
  String? createdAt;
  String? updatedAt;

  Course(
      {this.id,
        this.title,
        this.description,
        this.category,
        this.amount,
        this.institution,
        this.aboutTitle,
        this.aboutDescription,
        this.instructor,
        this.url,
        this.embadedUrl,
        this.duration,
        this.courseThumbnail,
        this.createdAt,
        this.updatedAt});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    amount = json['amount'];
    institution = json['institution'];
    aboutTitle = json['about_title'];
    aboutDescription = json['about_description'];
    instructor = json['instructor'];
    url = json['url'];
    embadedUrl = json['embaded_url'];
    duration = json['duration'];
    courseThumbnail = json['course_thumbnail'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['category'] = this.category;
    data['amount'] = this.amount;
    data['institution'] = this.institution;
    data['about_title'] = this.aboutTitle;
    data['about_description'] = this.aboutDescription;
    data['instructor'] = this.instructor;
    data['url'] = this.url;
    data['embaded_url'] = this.embadedUrl;
    data['duration'] = this.duration;
    data['course_thumbnail'] = this.courseThumbnail;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}