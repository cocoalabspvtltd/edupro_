class VoucherListResponse {
  String? status;
  String? message;
  List<Vouchers>? vouchers;

  VoucherListResponse({this.status, this.message, this.vouchers});

  VoucherListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['vouchers'] != null) {
      vouchers = <Vouchers>[];
      json['vouchers'].forEach((v) {
        vouchers!.add(new Vouchers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.vouchers != null) {
      data['vouchers'] = this.vouchers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vouchers {
  int? id;
  String? voucherName;
  String? voucherImage;
  Null? denominations;
  int? amount;
  Null? type;
  String? validity;
  String? createdAt;
  String? updatedAt;

  Vouchers(
      {this.id,
        this.voucherName,
        this.voucherImage,
        this.denominations,
        this.amount,
        this.type,
        this.validity,
        this.createdAt,
        this.updatedAt});

  Vouchers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    voucherName = json['voucher_name'];
    voucherImage = json['voucher_image'];
    denominations = json['denominations'];
    amount = json['amount'];
    type = json['type'];
    validity = json['validity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['voucher_name'] = this.voucherName;
    data['voucher_image'] = this.voucherImage;
    data['denominations'] = this.denominations;
    data['amount'] = this.amount;
    data['type'] = this.type;
    data['validity'] = this.validity;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}