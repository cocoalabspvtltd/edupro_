class AddInstructorResponse {
  bool? success;
  int? statusCode;
  Instructor? instructor;
  String? message;

  AddInstructorResponse(
      {this.success, this.statusCode, this.instructor, this.message});

  AddInstructorResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    instructor = json['instructor'] != null
        ? new Instructor.fromJson(json['instructor'])
        : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    if (this.instructor != null) {
      data['instructor'] = this.instructor!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Instructor {
  String? name;
  String? email;
  String? phoneNumber;
  String? description;
  String? courses;
  String? qualification;
  String? instituteName;
  String? displayPicture;
  String? updatedAt;
  String? createdAt;
  int? id;

  Instructor(
      {this.name,
        this.email,
        this.phoneNumber,
        this.description,
        this.courses,
        this.qualification,
        this.instituteName,
        this.displayPicture,
        this.updatedAt,
        this.createdAt,
        this.id});

  Instructor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    description = json['description'];
    courses = json['courses'];
    qualification = json['qualification'];
    instituteName = json['institute_name'];
    displayPicture = json['display_picture'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['description'] = this.description;
    data['courses'] = this.courses;
    data['qualification'] = this.qualification;
    data['institute_name'] = this.instituteName;
    data['display_picture'] = this.displayPicture;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}