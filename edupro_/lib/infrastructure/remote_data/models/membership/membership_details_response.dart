class MembershipDetailsResponse {
  Details? details;
  String? message;
  bool? status;

  MembershipDetailsResponse({this.details, this.message, this.status});

  MembershipDetailsResponse.fromJson(Map<String, dynamic> json) {
    details = json['list'] != null ? Details.fromJson(json['list']) : null;
    message = json['message'];
    status = json['status'];
  }
}

class Details {
  int? id;
  int? userId;
  String? purchasedDate;
  String? expiryDate;

  Details({this.id, this.userId, this.purchasedDate, this.expiryDate});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    purchasedDate = json['purchased_date'];
    expiryDate = json['expiry_date'];
  }
}
