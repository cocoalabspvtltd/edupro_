import 'package:dartz/dartz.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/membership/membership_details_response.dart';

abstract class IMembershipRepository {
  Future<Either<NetworkFailure, MembershipDetailsResponse>>
      getMembershipDetails(String userId);
}
