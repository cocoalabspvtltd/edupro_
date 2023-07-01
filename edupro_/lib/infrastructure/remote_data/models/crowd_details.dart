
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
    if (this.organizationDetails != null) {
      data['organizationDetails'] =
          this.organizationDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrganizationDetails {
  int? id;
  String? title;
  String? description;
  String? goalAmount;
  String? raisedAmount;
  int? isCollected;
  String? image;
  String? createdAt;
  String? updatedAt;

  OrganizationDetails(
      {this.id,
        this.title,
        this.description,
        this.goalAmount,
        this.raisedAmount,
        this.isCollected,
        this.image,
        this.createdAt,
        this.updatedAt});

  OrganizationDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    goalAmount = json['goal_amount'];
    raisedAmount = json['raised_amount'];
    isCollected = json['is_collected'];
    image = json['image'];
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
    data['is_collected'] = this.isCollected;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}