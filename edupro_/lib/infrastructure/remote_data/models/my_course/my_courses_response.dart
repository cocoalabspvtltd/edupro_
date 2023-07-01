class MyCoursesResponse {
  bool? success;
  int? statusCode;
  List<MyCourseData>? myCourseData;

  MyCoursesResponse({this.success, this.statusCode, this.myCourseData});

  MyCoursesResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    if (json['my_course_data'] != null) {
      myCourseData = <MyCourseData>[];
      json['my_course_data'].forEach((v) {
        myCourseData!.add(new MyCourseData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    if (this.myCourseData != null) {
      data['my_course_data'] =
          this.myCourseData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyCourseData {
  String? title;
  String? description;
  String? instructor;
  String? url;
  String? embadedUrl;
  String? courseThumbnail;
  String? createdAt;
  String? updatedAt;
  int? courseId;
  String? price;
  String? courseCategory;
  String? courseDuration;
  String? instituteName;
  List<Instructors>? instructors;
  AboutCourse? aboutCourse;

  MyCourseData(
      {this.title,
        this.description,
        this.instructor,
        this.url,
        this.embadedUrl,
        this.courseThumbnail,
        this.createdAt,
        this.updatedAt,
        this.courseId,
        this.price,
        this.courseCategory,
        this.courseDuration,
        this.instituteName,
        this.instructors,
        this.aboutCourse});

  MyCourseData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    instructor = json['instructor'];
    url = json['url'];
    embadedUrl = json['embaded_url'];
    courseThumbnail = json['course_thumbnail'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    courseId = json['course_id'];
    price = json['price'];
    courseCategory = json['course_category'];
    courseDuration = json['course_duration'];
    instituteName = json['institute_name'];
    if (json['instructors'] != null) {
      instructors = <Instructors>[];
      json['instructors'].forEach((v) {
        instructors!.add(new Instructors.fromJson(v));
      });
    }
    aboutCourse = json['about_course'] != null
        ? new AboutCourse.fromJson(json['about_course'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['instructor'] = this.instructor;
    data['url'] = this.url;
    data['embaded_url'] = this.embadedUrl;
    data['course_thumbnail'] = this.courseThumbnail;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['course_id'] = this.courseId;
    data['price'] = this.price;
    data['course_category'] = this.courseCategory;
    data['course_duration'] = this.courseDuration;
    data['institute_name'] = this.instituteName;
    if (this.instructors != null) {
      data['instructors'] = this.instructors!.map((v) => v.toJson()).toList();
    }
    if (this.aboutCourse != null) {
      data['about_course'] = this.aboutCourse!.toJson();
    }
    return data;
  }
}

class Instructors {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? description;
  String? courses;
  String? qualification;
  String? instituteName;
  String? displayPicture;
  Null? approvalStatus;
  String? createdAt;
  String? updatedAt;

  Instructors(
      {this.id,
        this.name,
        this.email,
        this.phoneNumber,
        this.description,
        this.courses,
        this.qualification,
        this.instituteName,
        this.displayPicture,
        this.approvalStatus,
        this.createdAt,
        this.updatedAt});

  Instructors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    description = json['description'];
    courses = json['courses'];
    qualification = json['qualification'];
    instituteName = json['institute_name'];
    displayPicture = json['display_picture'];
    approvalStatus = json['approval_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['description'] = this.description;
    data['courses'] = this.courses;
    data['qualification'] = this.qualification;
    data['institute_name'] = this.instituteName;
    data['display_picture'] = this.displayPicture;
    data['approval_status'] = this.approvalStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class AboutCourse {
  String? aboutTitle;
  String? aboutDescription;

  AboutCourse({this.aboutTitle, this.aboutDescription});

  AboutCourse.fromJson(Map<String, dynamic> json) {
    aboutTitle = json['about_title'];
    aboutDescription = json['about_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['about_title'] = this.aboutTitle;
    data['about_description'] = this.aboutDescription;
    return data;
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