class InstructorProfileResponse {
  String? status;
  String ?message;
  InstructorUser? user;

  InstructorProfileResponse({this.status, this.message,this.user});

  InstructorProfileResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? new InstructorUser.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user;
    }
    return data;
  }
}

class InstructorUser {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? description;
  String? courses;
  String? qualification;
  String? instituteName;
  String? displayPicture;
  String? approvalStatus;
  String? createdAt;
  String? updatedAt;
  String? profilePhoto;

  InstructorUser(
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
        this.updatedAt,
        this.profilePhoto});

  InstructorUser.fromJson(Map<String, dynamic> json) {
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
    profilePhoto = json['profile_photo'];
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
    data['profile_photo'] = this.profilePhoto;
    return data;
  }
}