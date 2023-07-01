import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pgs_edupro/domain/core/network/api_provider.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/domain/membership/i_membership_repository.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/membership/membership_details_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/source/api.dart';

class MembershipRepository implements IMembershipRepository {
  ApiProvider? apiClient;

  MembershipRepository() {
    apiClient ??= ApiProvider();
  }

  @override
  Future<Either<NetworkFailure, MembershipDetailsResponse>>
      getMembershipDetails(String userId) async {
    try {
      Response response = await apiClient!
          .getJsonInstance()
          .post(Api.getMembershipDetails, data: {"user_id": userId});

      return right(MembershipDetailsResponse.fromJson(response.data));
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
