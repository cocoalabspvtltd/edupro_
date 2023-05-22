class BidProductDetailsResponse {
  bool? success;
  int? statusCode;
  List<ProductDetails>? productDetails;
  List<String>? productGallery;
  List<Images>? images;

  BidProductDetailsResponse(
      {this.success,
        this.statusCode,
        this.productDetails,
        this.productGallery,
        this.images});

  BidProductDetailsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    if (json['productDetails'] != null) {
      productDetails = <ProductDetails>[];
      json['productDetails'].forEach((v) {
        productDetails!.add(new ProductDetails.fromJson(v));
      });
    }
    productGallery = json['product_gallery'].cast<String>();
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    if (this.productDetails != null) {
      data['productDetails'] =
          this.productDetails!.map((v) => v.toJson()).toList();
    }
    data['product_gallery'] = this.productGallery;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductDetails {
  int? id;
  String? productId;
  String? technicalDetails;
  String? features;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? price;
  String? startDate;
  String? endDate;

  ProductDetails(
      {this.id,
        this.productId,
        this.technicalDetails,
        this.features,
        this.createdAt,
        this.updatedAt,
        this.name,
        this.price,
        this.startDate,
        this.endDate});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    technicalDetails = json['technical_details'];
    features = json['features'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    price = json['price'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['technical_details'] = this.technicalDetails;
    data['features'] = this.features;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    data['price'] = this.price;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    return data;
  }
}

class Images {
  String? image;

  Images({this.image});

  Images.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    return data;
  }
}