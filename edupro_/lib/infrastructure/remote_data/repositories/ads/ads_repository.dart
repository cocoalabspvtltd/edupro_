import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pgs_edupro/domain/ads/i_ads_repository.dart';
import 'package:pgs_edupro/domain/core/network/api_provider.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/ads/ads_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/source/api.dart';

class AdsRepository implements IAdsRepository {
  ApiProvider? apiClient;

  AdsRepository() {
    apiClient ??= ApiProvider();
  }

  @override
  Future<Either<NetworkFailure, AdsResponse>> getAds() async {
    try {
      Response response =
          await apiClient!.getJsonInstance().get(Api.getAdsList);

      return right(AdsResponse.fromJson(response.data));
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
