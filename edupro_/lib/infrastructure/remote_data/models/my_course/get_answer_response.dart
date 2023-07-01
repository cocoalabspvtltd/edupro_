class GetAnswerResponse {
  GetAnswerResponse({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.aData,
  });
  late final bool success;
  late final int statusCode;
  late final String? message;
  late final List<AData>? aData;

  GetAnswerResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    aData = json['a_data'] != null
        ? List.from(json['a_data']).map((e) => AData.fromJson(e)).toList()
        : null;
  }
}

class AData {
  AData({
    required this.answerId,
    required this.answer,
    required this.timePosted,
    required this.datePosted,
    required this.userPosted,
  });
  late final int? answerId;
  late final String? answer;
  late final String? timePosted;
  late final String? datePosted;
  late final UserPosted? userPosted;

  AData.fromJson(Map<String, dynamic> json) {
    answerId = json['answer_id'];
    answer = json['answer'];
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
