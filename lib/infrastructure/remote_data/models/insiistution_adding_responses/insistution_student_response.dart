class StudentAddResponse {
  bool? success;
  int? statusCode;
  Student? student;
  String? message;


  StudentAddResponse(
      {this.success, this.statusCode, this.student, this.message,});

  StudentAddResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    student =
    json['student'] != null ? new Student.fromJson(json['student']) : null;
    message = json['message'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    if (this.student != null) {
      data['student'] = this.student!.toJson();
    }
    data['message'] = this.message;

    return data;
  }
}

class Student {
  String? name;
  String? email;
  String? institution;
  String? department;
  String? course;
  String? address;
  String? phoneNumber;
  String? dob;
  String? profilePhoto;
  String? updatedAt;
  String? createdAt;
  int? id;

  Student(
      {this.name,
        this.email,
        this.institution,
        this.department,
        this.course,
        this.address,
        this.phoneNumber,
        this.dob,
        this.profilePhoto,
        this.updatedAt,
        this.createdAt,
        this.id});

  Student.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    institution = json['institution'];
    department = json['department'];
    course = json['course'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    dob = json['dob'];
    profilePhoto = json['profile_photo'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['institution'] = this.institution;
    data['department'] = this.department;
    data['course'] = this.course;
    data['address'] = this.address;
    data['phone_number'] = this.phoneNumber;
    data['dob'] = this.dob;
    data['profile_photo'] = this.profilePhoto;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

