class CrowdFundingDetailsResponse {
  bool? success;
  int? statusCode;
  List<OrganizationDetails>? organizationDetails;

  CrowdFundingDetailsResponse(
      {this.success, this.statusCode, this.organizationDetails});

  CrowdFundingDetailsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    if (json['organizationDetails'] != null) {
      organizationDetails = <OrganizationDetails>[];
      json['organizationDetails'].forEach((v) {
        organizationDetails!.add(new OrganizationDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    if (organizationDetails != null) {
      data['organizationDetails'] =
          organizationDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrganizationDetails {
  int ?id;
  String? title;
  String? description;
  String? goalAmount;
  String? raisedAmount;
  Null createdAt;
  Null updatedAt;

  OrganizationDetails(
      {this.id,
        this.title,
        this.description,
        this.goalAmount,
        this.raisedAmount,
        this.createdAt,
        this.updatedAt});

  OrganizationDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    goalAmount = json['goal_amount'];
    raisedAmount = json['raised_amount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['goal_amount'] = this.goalAmount;
    data['raised_amount'] = this.raisedAmount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}