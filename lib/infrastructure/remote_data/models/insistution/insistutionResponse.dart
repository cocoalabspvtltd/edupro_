class InsistutionResponse {
  bool? success;
  int? statusCode;
  List<Course>? course;
  List<Instructors>? instructors;
  List<StudentList>? studentList;
  List<Category>? category;
  List<Count>? count;
  StudentList1?stude;
  InsistutionResponse(
      {this.success,
        this.statusCode,
        this.course,
        this.instructors,
        this.studentList,
        this.category,
        this.count,this.stude});

  InsistutionResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    if (json['course'] != null) {
      course = <Course>[];
      json['course'].forEach((v) {
        course!.add(new Course.fromJson(v));
      });
    }
    if (json['instructors'] != null) {
      instructors = <Instructors>[];
      json['instructors'].forEach((v) {
        instructors!.add(new Instructors.fromJson(v));
      });
    }
    if (json['student_list'] != null) {
      studentList = <StudentList>[];
      json['student_list'].forEach((v) {
        studentList!.add(new StudentList.fromJson(v));
      });
    }
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
    if (json['count'] != null) {
      count = <Count>[];
      json['count'].forEach((v) {
        count!.add(new Count.fromJson(v));
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
    if (this.instructors != null) {
      data['instructors'] = this.instructors!.map((v) => v.toJson()).toList();
    }
    if (this.studentList != null) {
      data['student_list'] = this.studentList!.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    if (this.count != null) {
      data['count'] = this.count!.map((v) => v.toJson()).toList();
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

class Instructors {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? address;
  String? qualification;
  String? courses;
  String? displayPicture;
  String? description;
  String? instituteName;

  Instructors(
      {this.id,
        this.name,
        this.email,
        this.phoneNumber,
        this.address,
        this.qualification,
        this.courses,
        this.displayPicture,
        this.description,
        this.instituteName});

  Instructors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    qualification = json['qualification'];
    courses = json['courses'];
    displayPicture = json['display_picture'];
    description = json['description'];
    instituteName = json['institute_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['address'] = this.address;
    data['qualification'] = this.qualification;
    data['courses'] = this.courses;
    data['display_picture'] = this.displayPicture;
    data['description'] = this.description;
    data['institute_name'] = this.instituteName;
    return data;
  }
}

class StudentList {
  int? id;
  String? name;
  String? email;
  String? institution;
  String? department;
  String? course;
  String? address;
  String? phoneNumber;
  String? dob;
  String? profilePhoto;
  int? status;
  String? createdAt;
  String? updatedAt;

  StudentList(
      {this.id,
        this.name,
        this.email,
        this.institution,
        this.department,
        this.course,
        this.address,
        this.phoneNumber,
        this.dob,
        this.profilePhoto,
        this.status,
        this.createdAt,
        this.updatedAt});

  StudentList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    institution = json['institution'];
    department = json['department'];
    course = json['course'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    dob = json['dob'];
    profilePhoto = json['profile_photo'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['institution'] = this.institution;
    data['department'] = this.department;
    data['course'] = this.course;
    data['address'] = this.address;
    data['phone_number'] = this.phoneNumber;
    data['dob'] = this.dob;
    data['profile_photo'] = this.profilePhoto;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
class StudentList1 {
  int? id;
  String? name;
  String? email;
  String? institution;
  String? department;
  String? course;
  String? address;
  String? phoneNumber;
  String? dob;
  String? profilePhoto;
  int? status;
  String? createdAt;
  String? updatedAt;

  StudentList1(
      {this.id,
        this.name,
        this.email,
        this.institution,
        this.department,
        this.course,
        this.address,
        this.phoneNumber,
        this.dob,
        this.profilePhoto,
        this.status,
        this.createdAt,
        this.updatedAt});

  StudentList1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    institution = json['institution'];
    department = json['department'];
    course = json['course'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    dob = json['dob'];
    profilePhoto = json['profile_photo'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['institution'] = this.institution;
    data['department'] = this.department;
    data['course'] = this.course;
    data['address'] = this.address;
    data['phone_number'] = this.phoneNumber;
    data['dob'] = this.dob;
    data['profile_photo'] = this.profilePhoto;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
class Category {
  int? id;
  String? name;
  String? categoryThumbnail;
  int? createdBy;
  String? createdAt;
  String? updatedAt;

  Category(
      {this.id,
        this.name,
        this.categoryThumbnail,
        this.createdBy,
        this.createdAt,
        this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryThumbnail = json['category_thumbnail'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category_thumbnail'] = this.categoryThumbnail;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Count {
  int? courseCount;
  int? studentsCount;
  int? instructorCount;
int?department;
  Count({this.courseCount, this.studentsCount, this.instructorCount});

  Count.fromJson(Map<String, dynamic> json) {
    courseCount = json['course_count'];
    studentsCount = json['students_count'];
    instructorCount = json['instructor_count'];
    department =json['department'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['course_count'] = this.courseCount;
    data['students_count'] = this.studentsCount;
    data['instructor_count'] = this.instructorCount;
    data['department']= this.department;
    return data;
  }
}