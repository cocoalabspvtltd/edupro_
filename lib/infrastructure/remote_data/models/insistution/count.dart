class CountResponse {
  bool? success;
  int? statusCode;
  int? userCount;
  int? instructorCount;
  int? courseCount;
  int? institution;
  List<Count>? count;

  CountResponse(
      {this.success,
        this.statusCode,
        this.userCount,
        this.instructorCount,
        this.courseCount,
        this.institution,
        this.count});

  CountResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    userCount = json['user_count'];
    instructorCount = json['instructor_count'];
    courseCount = json['course_count'];
    institution = json['institution'];
    if (json['count'] != null) {
      count = <Count>[];
      json['count'].forEach((v) {
        count!.add(new Count.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    data['user_count'] = this.userCount;
    data['instructor_count'] = this.instructorCount;
    data['course_count'] = this.courseCount;
    data['institution'] = this.institution;
    if (this.count != null) {
      data['count'] = this.count!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Count {
  int? userCount;
  int? instructorCount;
  int? courseCount;
  int? institutionCount;

  Count(
      {this.userCount,
        this.instructorCount,
        this.courseCount,
        this.institutionCount});

  Count.fromJson(Map<String, dynamic> json) {
    userCount = json['user_count'];
    instructorCount = json['instructor_count'];
    courseCount = json['course_count'];
    institutionCount = json['institution_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_count'] = this.userCount;
    data['instructor_count'] = this.instructorCount;
    data['course_count'] = this.courseCount;
    data['institution_count'] = this.institutionCount;
    return data;
  }
}