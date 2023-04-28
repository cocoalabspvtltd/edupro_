import 'package:dartz/dartz.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/bid_products/bid_product_detail_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/bid_products/bid_product_list_reponse.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/crowd.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/crowd_details.dart';
abstract class IBidsRepository {
  Future<Either<NetworkFailure, BidProductResponse>> getBidsList();
  Future<Either<NetworkFailure, BidProductResponse>> getLiveProductsList();
  Future<Either<NetworkFailure, BidProductResponse>> getUpcomingProductsList();
  Future<Either<NetworkFailure, BidProductResponse>> getClosedProductsList();
  Future<Either<NetworkFailure, BidProductDetailsResponse>> getProductDetails(String productId);
  Future<Either<NetworkFailure, CrowdFundingResponse>> getCrowdList();
  Future<Either<NetworkFailure, CrowdFundingDetailsResponse>> getCrowdDetailsList();
}
