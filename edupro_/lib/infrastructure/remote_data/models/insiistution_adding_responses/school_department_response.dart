class AddDepartmentResponse {
  String? status;
  String? statusCode;
  String? message;
  Department? department;

  AddDepartmentResponse(
      {this.status, this.statusCode, this.message, this.department});

  AddDepartmentResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    message = json['message'];
    department = json['department'] != null
        ? new Department.fromJson(json['department'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.department != null) {
      data['department'] = this.department!.toJson();
    }
    return data;
  }
}

class Department {
  String? name;
  String? instituteName;
  String? updatedAt;
  String? createdAt;
  int? id;

  Department(
      {this.name, this.instituteName, this.updatedAt, this.createdAt, this.id});

  Department.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    instituteName = json['institute_name'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['institute_name'] = this.instituteName;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}