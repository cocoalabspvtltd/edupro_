import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/common_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/profile/get_my_profile_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/profile/instructor_profile.dart';

abstract class IProfileRepository {
  Future<Either<NetworkFailure, MyProfileResponse>> getMyProfile(int userId);
  Future<Either<NetworkFailure, MyProfileResponse>> editMyProfile(Map body);
  Future<Either<NetworkFailure, MyProfileResponse>> updateDisplayPicture(
      FormData body);
  Future<Either<NetworkFailure, CommonResponse>> changePassword(Map body);
}
abstract class InstructorProfileRepository {
  Future<Either<NetworkFailure, InstructorProfileResponse>> getMyProfile(int userId);
  Future<Either<NetworkFailure, InstructorProfileResponse>> editMyProfile(Map body);
  Future<Either<NetworkFailure, InstructorProfileResponse>> updateDisplayPicture(
      FormData body);
  Future<Either<NetworkFailure, CommonResponse>> changePassword(Map body);
}