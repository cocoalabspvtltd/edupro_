class AdsResponse {
  bool? success;
  int? statusCode;
  String? message;
  List<AdsList>? adsList;

  AdsResponse({this.success, this.statusCode, this.message, this.adsList});

  AdsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    if (json['ads_list'] != null) {
      adsList = <AdsList>[];
      json['ads_list'].forEach((v) {
        adsList!.add(AdsList.fromJson(v));
      });
    }
  }
}

class AdsList {
  String? image;
  String? url;

  AdsList({this.image, this.url});

  AdsList.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    url = json['url'];
  }
}
