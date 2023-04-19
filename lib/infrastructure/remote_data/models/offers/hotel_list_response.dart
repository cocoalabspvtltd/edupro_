class HotelListResponse {
  bool? success;
  int? statusCode;
  List<HotelList>? hotelList;

  HotelListResponse({this.success, this.statusCode, this.hotelList});

  HotelListResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    if (json['hotel_list'] != null) {
      hotelList = <HotelList>[];
      json['hotel_list'].forEach((v) {
        hotelList!.add(new HotelList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    if (this.hotelList != null) {
      data['hotel_list'] = this.hotelList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HotelList {
  int? id;
  String? name;
  String? address;
  String? contact;
  String? websiteLink;
  int? roomRate;
  int? offerAmount;
  String? offerTitle;
  String? termsConditions;
  int? cardCount;
  String? discount;
  int? balanceAmount;
  String? hotelImage;
  String? createdAt;
  String? updatedAt;

  HotelList(
      {this.id,
        this.name,
        this.address,
        this.contact,
        this.websiteLink,
        this.roomRate,
        this.offerAmount,
        this.offerTitle,
        this.termsConditions,
        this.cardCount,
        this.discount,
        this.balanceAmount,
        this.hotelImage,
        this.createdAt,
        this.updatedAt});

  HotelList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    contact = json['contact'];
    websiteLink = json['website_link'];
    roomRate = json['room_rate'];
    offerAmount = json['offer_amount'];
    offerTitle = json['offer_title'];
    termsConditions = json['terms_conditions'];
    cardCount = json['card_count'];
    discount = json['discount'];
    balanceAmount = json['balance_amount'];
    hotelImage = json['hotel_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['contact'] = this.contact;
    data['website_link'] = this.websiteLink;
    data['room_rate'] = this.roomRate;
    data['offer_amount'] = this.offerAmount;
    data['offer_title'] = this.offerTitle;
    data['terms_conditions'] = this.termsConditions;
    data['card_count'] = this.cardCount;
    data['discount'] = this.discount;
    data['balance_amount'] = this.balanceAmount;
    data['hotel_image'] = this.hotelImage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}