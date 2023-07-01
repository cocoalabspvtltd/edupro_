class CommonResponse {
  String? message;
  String? status;

  CommonResponse({this.message, this.status});

  CommonResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }
}
