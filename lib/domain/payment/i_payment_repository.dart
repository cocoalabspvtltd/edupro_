import 'package:dartz/dartz.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/common_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/payment/get_payment_data_response.dart';

abstract class IPaymentRepository {
  Future<Either<NetworkFailure, PaymentDataResponse>> getPaymentData(Map data);
  Future<Either<NetworkFailure, CommonResponse>> postPaymentId(Map data);
}
