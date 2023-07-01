class GetQuestionsResponse {
  GetQuestionsResponse({
    required this.status,
    required this.success,
    required this.qData,
  });
  late final int status;
  late final bool success;
  late final List<QData>? qData;

  GetQuestionsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status_code'];
    success = json['success'];
    qData = json['q_data'] != null
        ? List.from(json['q_data']).map((e) => QData.fromJson(e)).toList()
        : null;
  }
}

class QData {
  QData({
    required this.questionId,
    required this.questionTitle,
    required this.questionSubject,
    required this.timePosted,
    required this.datePosted,
    required this.userPosted,
  });
  late final int? questionId;
  late final String? questionTitle;
  late final String? questionSubject;
  late final String? timePosted;
  late final String? datePosted;
  late final UserPosted? userPosted;

  QData.fromJson(Map<String, dynamic> json) {
    questionId = json['question_id'];
    questionTitle = json['question_title'];
    questionSubject = json['question_subject'];
    timePosted = json['time_posted'];
    datePosted = json['date_posted'];
    userPosted = json['user_posted'] != null
        ? UserPosted.fromJson(json['user_posted'])
        : null;
  }
}

class UserPosted {
  UserPosted({
    required this.userId,
    required this.name,
    required this.displayPicture,
  });
  late final int? userId;
  late final String? name;
  late final String? displayPicture;

  UserPosted.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    displayPicture = json['display_picture'];
  }
}
