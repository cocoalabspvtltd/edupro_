import 'package:dartz/dartz.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/bid_products/bid_product_list_reponse.dart';
abstract class IBidsRepository {
  Future<Either<NetworkFailure, BidProductResponse>> getBidsList();
}
