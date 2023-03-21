class MyProfileResponse {
  User? user;
  String? message;
  String? status;

  MyProfileResponse({this.user, this.message, this.status});

  MyProfileResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null
        ? User.fromJson(json['user'])
        : json['data'] != null
            ? User.fromJson(json['data'])
            : null;
    message = json['message'];
    status = json['status'];
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? dob;
  String? address;
  String? userStatus;
  String? profilePhoto;
  // int? status;
  // int? verificationCode;

  User({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.dob,
    this.address,
    this.userStatus,
    this.profilePhoto,
    // this.status,
    // this.verificationCode
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    dob = json['dob'];
    address = json['address'];
    userStatus = json['user_status'];
    profilePhoto = json['profile_photo'];
    // status = json['status'];
    // verificationCode = json['verification_code'];
  }
}
