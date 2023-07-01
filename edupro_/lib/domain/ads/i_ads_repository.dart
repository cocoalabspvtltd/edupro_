import 'package:dartz/dartz.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/ads/ads_response.dart';

abstract class IAdsRepository {
  Future<Either<NetworkFailure, AdsResponse>> getAds();
}
