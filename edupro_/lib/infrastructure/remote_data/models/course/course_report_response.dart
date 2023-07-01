class MyCourseReportResponse {
  MyCourseReportResponse({
    this.reportList,
    this.message,
    this.status,
  });

  List<List<ReportList>>? reportList;
  String? message;
  bool? status;

  factory MyCourseReportResponse.fromJson(Map<String, dynamic> json) =>
      MyCourseReportResponse(
        reportList: json["list"] == null
            ? []
            : List<List<ReportList>>.from(json["list"]!.map((x) =>
                List<ReportList>.from(x.map((x) => ReportList.fromJson(x))))),
        message: json["message"],
        status: json["status"],
      );
}

class ReportList {
  ReportList({
    this.id,
    this.title,
    this.description,
    this.category,
    this.amount,
    this.institution,
    this.aboutTitle,
    this.aboutDescription,
    this.instructor,
    this.url,
    this.embadedUrl,
    this.duration,
    this.courseThumbnail,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  String? description;
  String? category;
  String? amount;
  String? institution;
  String? aboutTitle;
  String? aboutDescription;
  String? instructor;
  String? url;
  String? embadedUrl;
  String? duration;
  String? courseThumbnail;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ReportList.fromJson(Map<String, dynamic> json) => ReportList(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        category: json["category"],
        amount: json["amount"],
        institution: json["institution"],
        aboutTitle: json["about_title"],
        aboutDescription: json["about_description"],
        instructor: json["instructor"],
        url: json["url"],
        embadedUrl: json["embaded_url"],
        duration: json["duration"],
        courseThumbnail: json["course_thumbnail"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );
}
