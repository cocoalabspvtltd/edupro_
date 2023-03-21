import 'package:dartz/dartz.dart';
import 'package:pgs_edupro/domain/auth/auth_failure.dart';
import 'package:pgs_edupro/domain/auth/user.dart';
import 'package:pgs_edupro/domain/auth/value_objects.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/auth/user_login_response.dart';

abstract class IAuthFacade {
  Future<Option<User>> getSignedInUser();
  Future<Either<AuthFailure, UserLogInResponse>> registerWithEmailAndPassword({
    required Name name,
    required EmailAddress emailAddress,
    required Password password,
    required Password confirmPassword,
    required String userStatus,
  });
  Future<Either<AuthFailure, UserLogInResponse>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<Either<AuthFailure, Unit>> verifyEduproUser({
    required String verificationCode,
    required String userId
  });
  Future<void> signOut();
}
