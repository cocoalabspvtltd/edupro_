class PaymentDataResponse {
  PaymentDataResponse({
    this.message,
    this.success,
    this.gateWayKey,
    this.orderId,
  });

  String? message;
  bool? success;
  String? gateWayKey;
  String? orderId;

  PaymentDataResponse.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    success = json["success"];
    gateWayKey = json["key_id"];
    orderId = json["order_id"];
  }
}
