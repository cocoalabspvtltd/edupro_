import 'package:dartz/dartz.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/offers/hotel_list_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/offers/vouchers_list_response.dart';
abstract class IOffersRepository {
  Future<Either<NetworkFailure, HotelListResponse>> getHotelList();
  Future<Either<NetworkFailure, HotelListResponse>> getVoucherList();
}
