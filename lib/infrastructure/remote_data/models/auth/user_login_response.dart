

class UserLogInResponse {
  bool? success;
  String? status;
  String? type;
  String? message;
  UserDetails? user;
  Instructor? instructor;
  Institution? institution;
  School? school;
  String? token;

  UserLogInResponse(
      {this.success,
        this.status,
        this.type,
        this.message,
        this.user,
        this.instructor,
        this.institution,
        this.school,
        this.token});

  UserLogInResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    type = json['type'];
    message = json['message'];
    user = json['user'] != null ? new UserDetails.fromJson(json['user']) : null;
    token = json['token'];
    instructor = json['instructor'] != null
        ? Instructor.fromJson(json['instructor'])
        : null;
    institution = json['institution'] != null
        ? Institution.fromJson(json['institution'])
        : null;
    // if (json['institution'] != null) {
    //   institution = <Institution>[];
    //   json['institution'].forEach((v) {
    //     institution!.add(new Institution.fromJson(v));
    //   });
    // }
    school =
    json['school'] != null ? School.fromJson(json['school']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['success'] = success;
    data['status'] = status;
    data['type'] = type;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    // if (this.instructor != null) {
    //   data['instructor'] = this.instructor!.map((v) => v.toJson()).toList();
    // }
    if (instructor != null) {
      data['instructor'] = instructor!.toJson();
    }
    if (institution != null) {
      data['institution'] = institution!.toJson();
    }
    if (school != null) {
      data['school'] = school!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class UserDetails {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? dob;
  String? address;
  String? userStatus;
  Null? institution;
  String? profilePhoto;
  int? status;
  String? paymentStatus;
  int? verificationCode;
  String? createdAt;
  String? updatedAt;

  UserDetails(
      {this.id,
        this.name,
        this.email,
        this.phoneNumber,
        this.dob,
        this.address,
        this.userStatus,
        this.institution,
        this.profilePhoto,
        this.status,
        this.paymentStatus,
        this.verificationCode,
        this.createdAt,
        this.updatedAt});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    dob = json['dob'];
    address = json['address'];
    userStatus = json['user_status'];
    institution = json['institution'];
    profilePhoto = json['profile_photo'];
    status = json['status'];
    paymentStatus = json['payment_status'];
    verificationCode = json['verification_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['dob'] = this.dob;
    data['address'] = this.address;
    data['user_status'] = this.userStatus;
    data['institution'] = this.institution;
    data['profile_photo'] = this.profilePhoto;
    data['status'] = this.status;
    data['payment_status'] = this.paymentStatus;
    data['verification_code'] = this.verificationCode;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}



class Instructor {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? description;
  String? courses;
  String? qualification;
  Null? instituteName;
  String? displayPicture;
  String? approvalStatus;
  String? createdAt;
  String? updatedAt;
  String? userStatus;

  Instructor(
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
        this.userStatus});

  Instructor.fromJson(Map<String, dynamic> json) {
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
    userStatus = json['user_status'];
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
    data['user_status'] = this.userStatus;
    return data;
  }
}
class Institution {
  int? id;
  String? name;
  String? email;
  String? code;
  String? address;
  String? contactNumber;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? userStatus;

  Institution(
      {this.id,
        this.name,
        this.email,
        this.code,
        this.address,
        this.contactNumber,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.userStatus});

  Institution.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    code = json['code'];
    address = json['address'];
    contactNumber = json['contact_number'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userStatus = json['user_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['code'] = code;
    data['address'] = address;
    data['contact_number'] = contactNumber;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['user_status'] = userStatus;
    return data;
  }
}

class School {
  int? id;
  String? name;
  String? email;
  String? code;
  String? address;
  String? contactNumber;
  String? image;
  String? createdAt;
  String? updatedAt;

  School(
      {this.id,
        this.name,
        this.email,
        this.code,
        this.address,
        this.contactNumber,
        this.image,
        this.createdAt,
        this.updatedAt});

  School.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    code = json['code'];
    address = json['address'];
    contactNumber = json['contact_number'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['code'] = code;
    data['address'] = address;
    data['contact_number'] = contactNumber;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}