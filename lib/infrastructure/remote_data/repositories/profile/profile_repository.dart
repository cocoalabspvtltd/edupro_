import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pgs_edupro/domain/core/network/api_provider.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/domain/profile/i_profile_repository.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/common_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/profile/get_my_profile_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/source/api.dart';

class ProfileRepository implements IProfileRepository {
  ApiProvider? apiClient;

  ProfileRepository() {
    apiClient ??= ApiProvider();
  }

  @override
  Future<Either<NetworkFailure, MyProfileResponse>> editMyProfile(
      Map body) async {
    log("body->${body}");
    try {
      Response response = await apiClient!
          .getJsonInstance()
          .post(Api.editMyProfile, data: body);

      return right(MyProfileResponse.fromJson(response.data));
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
  Future<Either<NetworkFailure, MyProfileResponse>> getMyProfile(
      int userId) async {
    try {
      Response response = await apiClient!
          .getJsonInstance()
          .get(Api.getMyProfile, queryParameters: {"user_id": userId});

      return right(MyProfileResponse.fromJson(response.data));
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
  Future<Either<NetworkFailure, MyProfileResponse>> updateDisplayPicture(
      FormData body) async {
    try {
      Response response = await apiClient!
          .getJsonInstance()
          .post(Api.updateDisplayPicture, data: body);

      return right(MyProfileResponse.fromJson(response.data));
    } on DioError catch (e) {
      if (e.response != null) {
        log(e.response!.statusCode.toString());
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
  Future<Either<NetworkFailure, CommonResponse>> changePassword(
      Map body) async {
    try {
      Response response = await apiClient!
          .getJsonInstance()
          .post(Api.changePassword, data: body);

      return right(CommonResponse.fromJson(response.data));
    } on DioError catch (e) {
      if (e.response != null) {
        log(e.response!.statusCode.toString());
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
