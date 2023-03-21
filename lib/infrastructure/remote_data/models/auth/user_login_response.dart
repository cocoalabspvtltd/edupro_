class UserLogInResponse {
  UserDetails? user;
  String? message;
  String? status;
  Instructor? instructor;
   late String type;
  String? token;

  UserLogInResponse({this.user, this.message,required this.type, this.status,this.instructor});

  UserLogInResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    message = json['message'];
    status = json['status'];
    type = json['type'];
    token = json['token'];
  }
}

class UserDetails {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? dob;
  String? address;
  String? paymentStatus;
  String? userStatus;
  int? status;
  String? createdAt;
  String? updatedAt;

  UserDetails(
      {this.id,
      this.name,
      this.email,
      this.phoneNumber,
      this.dob,
      this.address,
      this.paymentStatus,
      this.userStatus,
      this.status,
      this.createdAt,
      this.updatedAt});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'] ?? '';
    dob = json['dob'] ?? '';
    address = json['address'] ?? '';
    paymentStatus = json['payment_status'] ?? 'false';
    userStatus = json['user_status'] ?? 'not_verified';
    status = json['status'] ?? 0;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
  String? instituteName;
  String? displayPicture;
  String? approvalStatus;
  String? createdAt;
  String? updatedAt;
  String? user_status;

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
        this.user_status});

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
    user_status=json['user_status'];
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
    data["user_status"] = this.user_status;
    return data;
  }
}

