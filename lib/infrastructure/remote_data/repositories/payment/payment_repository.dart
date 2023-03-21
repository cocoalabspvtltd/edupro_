import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pgs_edupro/domain/core/network/api_provider.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/domain/payment/i_payment_repository.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/common_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/payment/get_payment_data_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/source/api.dart';

class PaymentRepository implements IPaymentRepository {
  ApiProvider? apiClient;

  PaymentRepository() {
    apiClient ??= ApiProvider();
  }

  @override
  Future<Either<NetworkFailure, PaymentDataResponse>> getPaymentData(
      Map data) async {
    try {
      Response response = await apiClient!
          .getJsonInstance()
          .post(Api.getPaymentData, data: data);

      return right(PaymentDataResponse.fromJson(response.data));
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 401) {
          return left(
              NetworkFailure.unAuthorized(e.response!.data["message"] ?? ''));
        }
        return left(NetworkFailure.serverError(
            "Status Code ${e.response!.statusCode}"));
      } else if (e.toString().contains('Connecting timed out')) {
        return left(const NetworkFailure.serverTimeOut());
      }
      return left(const NetworkFailure.unexpected());
    } catch (e) {
      return left(const NetworkFailure.unexpected());
    }
  }

  @override
  Future<Either<NetworkFailure, CommonResponse>> postPaymentId(Map data) async {
    try {
      Response response = await apiClient!
          .getJsonInstance()
          .post(Api.postOaymentId, data: data);

      return right(CommonResponse.fromJson(response.data));
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 401) {
          return left(
              NetworkFailure.unAuthorized(e.response!.data["message"] ?? ''));
        }
        return left(NetworkFailure.serverError(
            "Status Code ${e.response!.statusCode}"));
      } else if (e.toString().contains('Connecting timed out')) {
        return left(const NetworkFailure.serverTimeOut());
      }
      return left(const NetworkFailure.unexpected());
    } catch (e) {
      return left(const NetworkFailure.unexpected());
    }
  }
}
