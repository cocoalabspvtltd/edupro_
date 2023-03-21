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
