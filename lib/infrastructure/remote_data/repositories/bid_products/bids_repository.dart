import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pgs_edupro/domain/bid_products/i_bids_repository.dart';
import 'package:pgs_edupro/domain/core/network/api_provider.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/bid_products/bid_product_detail_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/bid_products/bid_product_list_reponse.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/crowd.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/crowd_details.dart';
import 'package:pgs_edupro/infrastructure/remote_data/source/api.dart';




class BidsRepository implements IBidsRepository {
  ApiProvider? apiClient;

  BidsRepository() {
    apiClient ??= ApiProvider();
  }


  @override
  Future<Either<NetworkFailure, BidProductResponse>> getBidsList() async {
    try {
      Response response = await apiClient!
          .getJsonInstance()
          .get(Api.getBidList);

      return right(BidProductResponse.fromJson(response.data));
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
      log(e.toString());
      return left(const NetworkFailure.unexpected());
    }
  }

  @override
  Future<Either<NetworkFailure, BidProductResponse>> getLiveProductsList() async {
    try {
      Response response = await apiClient!
          .getJsonInstance()
          .get(Api.getLiveProductList);

      return right(BidProductResponse.fromJson(response.data));
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
      log(e.toString());
      return left(const NetworkFailure.unexpected());
    }
  }

  @override
  Future<Either<NetworkFailure, BidProductResponse>> getUpcomingProductsList() async {
    try {
      Response response = await apiClient!
          .getJsonInstance()
          .get(Api.getUpcomingProductList);

      return right(BidProductResponse.fromJson(response.data));
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
      log(e.toString());
      return left(const NetworkFailure.unexpected());
    }
  }

  @override
  Future<Either<NetworkFailure, BidProductResponse>> getClosedProductsList() async {
    try {
      Response response = await apiClient!
          .getJsonInstance()
          .get(Api.getClosedProductList);

      return right(BidProductResponse.fromJson(response.data));
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
      log(e.toString());
      return left(const NetworkFailure.unexpected());
    }
  }

  @override
  Future<Either<NetworkFailure, BidProductDetailsResponse>> getProductDetails(String productId
      ) async {

    try {
      Response response = await apiClient!
          .getJsonInstance()
          .post(Api.getProductDetails, data: {"productId":productId});
      print("response->${response.data}");
      return right(BidProductDetailsResponse.fromJson(response.data));
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
  Future<Either<NetworkFailure, CrowdFundingResponse>> getCrowdList() async {
    try {
      Response response = await apiClient!
          .getJsonInstance()
          .get(Api.getCrowd);

      return right(CrowdFundingResponse.fromJson(response.data));
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
      log(e.toString());
      return left(const NetworkFailure.unexpected());
    }
  }

  @override
  Future<Either<NetworkFailure, CrowdFundingDetailsResponse>> getCrowdDetailsList() async {
    try {
      Response response = await apiClient!
          .getJsonInstance()
          .get(Api.getCrowd);

      return right(CrowdFundingDetailsResponse.fromJson(response.data));
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
      log(e.toString());
      return left(const NetworkFailure.unexpected());
    }
  }
}


