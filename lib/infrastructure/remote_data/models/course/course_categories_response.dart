class CourseCategoriesResponse {
  List<CourseCategory>? categoryList;
  String? message;
  bool? status;

  CourseCategoriesResponse({this.categoryList, this.message, this.status});

  CourseCategoriesResponse.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      categoryList = <CourseCategory>[];
      json['list'].forEach((v) {
        categoryList!.add(CourseCategory.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }
}

class CourseCategory {
  int? id;
  String? categoryName;
  String? categoryThumbnail;
  String? description;

  CourseCategory(
      {this.id, this.categoryName, this.categoryThumbnail, this.description});

  CourseCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['name'];
    categoryThumbnail = json['category_thumbnail'];
    description = json['description'];
  }
}
