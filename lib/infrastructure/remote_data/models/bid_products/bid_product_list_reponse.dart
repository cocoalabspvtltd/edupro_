class BidProductResponse {
  bool? success;
  int? statusCode;
  List<BidProducts>? bidProducts;

  BidProductResponse({this.success, this.statusCode, this.bidProducts});

  BidProductResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    if (json['bid_products'] != null) {
      bidProducts = <BidProducts>[];
      json['bid_products'].forEach((v) {
        bidProducts!.add(new BidProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    if (this.bidProducts != null) {
      data['bid_products'] = this.bidProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BidProducts {
  int? id;
  String? name;
  String? auctionId;
  String? price;
  String? shippingFee;
  Null? bidResetTime;
  String? startTime;
  String? endTime;
  String? startDate;
  String? productImage;
  String? createdAt;
  String? updatedAt;

  BidProducts(
      {this.id,
        this.name,
        this.auctionId,
        this.price,
        this.shippingFee,
        this.bidResetTime,
        this.startTime,
        this.endTime,
        this.startDate,
        this.productImage,
        this.createdAt,
        this.updatedAt});

  BidProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    auctionId = json['auction_id'];
    price = json['price'];
    shippingFee = json['shipping_fee'];
    bidResetTime = json['bid_reset_time'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    startDate = json['start_date'];
    productImage = json['product_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['auction_id'] = this.auctionId;
    data['price'] = this.price;
    data['shipping_fee'] = this.shippingFee;
    data['bid_reset_time'] = this.bidResetTime;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['start_date'] = this.startDate;
    data['product_image'] = this.productImage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}