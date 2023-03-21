class CourseInCategoryResponse {
  CourseInCategoryResponse({
    required this.status,
    required this.message,
    required this.courseList,
  });
  late final bool status;
  late final String message;
  late final List<CourseList>? courseList;

  CourseInCategoryResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    courseList = json['course_list'] != null
        ? List.from(json['course_list'])
            .map((e) => CourseList.fromJson(e))
            .toList()
        : null;
  }
}

class CourseList {
  CourseList({
    required this.courseId,
    required this.title,
    required this.instructors,
    required this.courseCategory,
    required this.courseThumbnail,
    this.coursePreviewVideoUrl,
    required this.courseDuration,
    required this.price,
    required this.aboutCourse,
  });
  late final int? courseId;
  late final String? title;
  late final List<Instructors>? instructors;
  late final String? courseCategory;
  late final String? courseThumbnail;
  late final String? coursePreviewVideoUrl;
  late final String? courseDuration;
  late final String? price;
  late final AboutCourse? aboutCourse;

  CourseList.fromJson(Map<String, dynamic> json) {
    courseId = json['course_id'];
    title = json['title'];
    instructors = json['instructors'] != null
        ? List.from(json['instructors'])
            .map((e) => Instructors.fromJson(e))
            .toList()
        : null;
    courseCategory = json['course_category'];
    courseThumbnail = json['course_thumbnail'];
    coursePreviewVideoUrl = json['course_preview_video_url'];
    courseDuration = json['course_duration'];
    price = json['price'];
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
