
class MyProfileResponse {
  String ?status;
  String? message;
  User? user;

  MyProfileResponse({this.status, this.message, this.user});

  MyProfileResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? dob;
  String? address;
  String? description;
  String? courses;
  String? qualification;
  String? instituteName;
  String? displayPicture;
  String? approvalStatus;
  String? createdAt;
  String? updatedAt;
  String? profilePhoto;

  User(
      {this.id,
        this.name,
        this.email,
        this.phoneNumber,
        this.dob,
        this.address,
        this.description,
        this.courses,
        this.qualification,
        this.instituteName,
        this.displayPicture,
        this.approvalStatus,
        this.createdAt,
        this.updatedAt,
        this.profilePhoto});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    dob = json['dob'];
    address = json['address'];
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
    data['dob'] = this.dob;
    data['address']=this.address;
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

// class User {
//   int? id;
//   String? name;
//   String? email;
//   String? phoneNumber;
//   String? dob;
//   String? address;
//   String? description;
//   String? courses;
//   String? qualification;
//   String? instituteName;
//   String? displayPicture;
//   Null? approvalStatus;
//   String? createdAt;
//   String? updatedAt;
//   String? profilePhoto;
//
//   User({this.id, this.name, this.email, this.phoneNumber, this.address,this.dob,this.description, this.courses, this.qualification, this.instituteName, this.displayPicture, this.approvalStatus, this.createdAt, this.updatedAt, this.profilePhoto});
//
//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     phoneNumber = json['phone_number'];
//     dob = json['dob'];
//     address =json['address'];
//     description = json['description'];
//     courses = json['courses'];
//     qualification = json['qualification'];
//     instituteName = json['institute_name'];
//     displayPicture = json['display_picture'];
//     approvalStatus = json['approval_status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     profilePhoto = json['profile_photo'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['email'] = this.email;
//     data['phone_number'] = this.phoneNumber;
//     data['dob']=this.dob;
//     data['address']=this.address;
//     data['description'] = this.description;
//     data['courses'] = this.courses;
//     data['qualification'] = this.qualification;
//     data['institute_name'] = this.instituteName;
//     data['display_picture'] = this.displayPicture;
//     data['approval_status'] = this.approvalStatus;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['profile_photo'] = this.profilePhoto;
//     return data;
//   }
// }