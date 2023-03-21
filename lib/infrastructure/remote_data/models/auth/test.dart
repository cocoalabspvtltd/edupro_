class StudentRegister {
  StudentUser? user;
  String? token;
  String? message;
  String? status;

  StudentRegister({this.user, this.token, this.message, this.status});

  StudentRegister.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new StudentUser.fromJson(json['user']) : null;
    token = json['token'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class StudentUser {
  String? name;
  String? email;
  String? status;
  int? verificationCode;
  String? userStatus;
  String? paymentStatus;
  String? updatedAt;
  String? createdAt;
  int? id;

  StudentUser (
      {this.name,
        this.email,
        this.status,
        this.verificationCode,
        this.userStatus,
        this.paymentStatus,
        this.updatedAt,
        this.createdAt,
        this.id});

  StudentUser.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    status = json['status'];
    verificationCode = json['verification_code'];
    userStatus = json['user_status'];
    paymentStatus = json['payment_status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['status'] = this.status;
    data['verification_code'] = this.verificationCode;
    data['user_status'] = this.userStatus;
    data['payment_status'] = this.paymentStatus;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}