class AnnouncementsResponse {
  AnnouncementsResponse({
    required this.statusCode,
    required this.message,
    required this.courseAnnouncementData,
  });
  late final int statusCode;
  late final bool success;
  late final String? message;
  late final List<CourseAnnouncementData>? courseAnnouncementData;

  AnnouncementsResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    success = json['success'];
    message = json['message'];
    courseAnnouncementData = json['course_announcement_data'] != null
        ? List.from(json['course_announcement_data'])
            .map((e) => CourseAnnouncementData.fromJson(e))
            .toList()
        : null;
  }
}

class CourseAnnouncementData {
  CourseAnnouncementData({
    required this.timePosted,
    required this.datePosted,
    required this.announcementTitle,
    required this.announcementSubject,
  });
  late final String? timePosted;
  late final String? datePosted;
  late final String? announcementTitle;
  late final String? announcementSubject;

  CourseAnnouncementData.fromJson(Map<String, dynamic> json) {
    timePosted = json['time_posted'];
    datePosted = json['date_posted'];
    announcementTitle = json['announcement_title'];
    announcementSubject = json['announcement_subject'];
  }
}
