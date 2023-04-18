class DepartmentListResponse {
  bool? success;
  int? statusCode;
  String? message;
  List<Department>? department;

  DepartmentListResponse(
      {this.success, this.statusCode, this.message, this.department});

  DepartmentListResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    if (json['department'] != null) {
      department = <Department>[];
      json['department'].forEach((v) {
        department!.add(new Department.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.department != null) {
      data['department'] = this.department!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Department {
  int? id;
  String? name;
  String? instituteName;
  String? createdAt;
  String? updatedAt;

  Department(
      {this.id, this.name, this.instituteName, this.createdAt, this.updatedAt});

  Department.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    instituteName = json['institute_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['institute_name'] = this.instituteName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}