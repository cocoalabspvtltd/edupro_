
import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pgs_edupro/domain/auth/auth_failure.dart';
import 'package:pgs_edupro/domain/auth/i_auth_facade.dart';
import 'package:pgs_edupro/domain/auth/user.dart';
import 'package:pgs_edupro/domain/auth/value_objects.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/domain/core/value_objects.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/shared_prefs.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/auth/auth_repository.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/auth/server_user_mapper.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/auth/user_login_response.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';

class ServerAuthFacade implements IAuthFacade {
  final AuthRepository _authRepository = AuthRepository();
  final ServerUserMapper _serverUserMapper = ServerUserMapper();

  ServerAuthFacade();

  @override
  Future<Option<User>> getSignedInUser() async {
    await SharedPrefs.init();
    String uId = UserDetailsLocal.userId; //SharedPrefs.getString('spUserId');
    String uName = UserDetailsLocal.userName; //SharedPrefs.getString('spName');
    String uEmail =
        UserDetailsLocal.userEmail; //SharedPrefs.getString('spEmail');
    String uStatus = SharedPrefs.getString('spUserStatus');
    String uPaymentStatus = 'true'; //SharedPrefs.getString('spPaymentStatus');
    User user = User(
        id: '', name: StringSingleLine(''), emailAddress: EmailAddress(''), type: '');
    if (uStatus != 'edu_user' &&
        uPaymentStatus != 'false' &&
        uPaymentStatus != '') {
      user = User(
          id: uId,
          name: StringSingleLine(uName),
          emailAddress: EmailAddress(uEmail), type: UserDetailsLocal.type);
    }
    return optionOf(_serverUserMapper.toDomain(user));
  }

  @override
  Future<Either<AuthFailure, UserLogInResponse>> registerWithEmailAndPassword({
    required Name name,
    required EmailAddress emailAddress,
    required Password password,
    required Password confirmPassword,
    required String userStatus,
  }) async {
    log("=>${userStatus}");
    final emailAddressStr = emailAddress.value.getOrElse(() => 'INVALID EMAIL');
    final passwordStr = password.value.getOrElse(() => 'INVALID PASSWORD');
    final nameStr = name.value.getOrElse(() => 'INVALID NAME');
    int status = userStatus == 'new_user' ? 1 : 0;
    log("=>${userStatus}");
    Map body = {
      'email': emailAddressStr,
      'password': passwordStr,
      'password_confirmation': passwordStr,
      'name': nameStr,
      'status': status,
      'user_status': userStatus,
    };

    try {
      return await _authRepository
          .registerUser(json.encode(body))
          .then((response) async {
        log("gf");
        if (response.data['status_code'] == '422') {
          if (response.data['message'] == 'The email has already been taken') {
            return left(const AuthFailure.emailAlreadyInUse());
          } else {
            return left(const AuthFailure.serverError());
          }
        } else if (response.data['message'] == 'Successfully Created' ||
            response.data['success'].toString() == 'true') {
          log("fre");
          final r = UserLogInResponse.fromJson(response.data);
          log("=>>>>>>>${r}");
          if (userStatus == 'new_user') {
            try {
              await SharedPrefs.logIn(r);

              UserDetailsLocal.set(
                  r.token!,
                  r.user!.id.toString(),
                  r.user!.name ?? '',
                  r.user!.email ?? '',
                  r.user!.phoneNumber ?? '',
                  r.user!.dob?.toString() ?? '',
                  r.user!.address ?? '',
                  '',
                  );
            } catch (e) {
              toastMessage('Unexpected Response');
              log("shared pref ${e.toString()}");
            }
          }
          return right(r);
        } else {
          return left(const AuthFailure.serverError());
        }
      });
    } catch (e) {
      if (e.toString() == 'ERROR_EMAIL_ALREADY_IN_USE') {
        return left(const AuthFailure.emailAlreadyInUse());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }
  @override
  Future<Either<AuthFailure, UserLogInResponse>> registerWithInstructorEmailAndPassword({
    required Name name,
    required EmailAddress emailAddress,
    required Password password,
    required Password confirmPassword,
    required String userStatus,
    required Qualification quali

  }) async {
    final emailAddressStr = emailAddress.value.getOrElse(() => 'INVALID EMAIL');
    final passwordStr = password.value.getOrElse(() => 'INVALID PASSWORD');
    final nameStr = name.value.getOrElse(() => 'INVALID NAME');
    final qualiStr = quali.value.getOrElse(() => 'INVALID NAME');
    String status = "individual_instructor";
    Map body = {
      'email': emailAddressStr,
      'password': passwordStr,
      'password_confirmation': passwordStr,
      'name': nameStr,
      'user_status': userStatus,
      'qualification':qualiStr
    };
    print("map=>${body}");
    try {
      return await _authRepository
          .registerUser(json.encode(body))
          .then((response) async {
        log("=->${response}");
        if (response.data['status_code'] == '422') {
          if (response.data['message'] == 'The email has already been taken') {
            return left(const AuthFailure.emailAlreadyInUse());
          } else {
            return left(const AuthFailure.serverError());
          }
        } else if (response.data['message'] == 'Successfully Created' ||
            response.data['success'].toString() == 'true') {
          final r = UserLogInResponse.fromJson(response.data);
          log("->${userStatus}");
          if (userStatus == 'individual_instructor') {
            try {
              await SharedPrefs.logIn(r);
              log("->${r.instructor!.name}");
              UserDetailsLocal.set(
                  r.token!,
                  r.instructor!.id.toString(),
                  r.instructor!.name!,
                  r.instructor!.email!,
                  "","","","",
              );
            } catch (e) {
              toastMessage('Unexpected Response');
              log("shared pref ${e.toString()}");
            }
          }
          return right(r);
        } else {
          return left(const AuthFailure.serverError());
        }
      });
    } catch (e) {
      if (e.toString() == 'ERROR_EMAIL_ALREADY_IN_USE') {
        return left(const AuthFailure.emailAlreadyInUse());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, UserLogInResponse>> registerWithInstitutionEmailAndPassword({
    required Name name,
    required EmailAddress emailAddress,
    required Password password,
    required Password confirmPassword,
    required String userStatus,
    required Address address,
    required Code code,

  }) async {
    final emailAddressStr = emailAddress.value.getOrElse(() => 'INVALID EMAIL');
    final passwordStr = password.value.getOrElse(() => 'INVALID PASSWORD');
    final nameStr = name.value.getOrElse(() => 'INVALID NAME');
    final addressStr = address.value.getOrElse(() => 'INVALID NAME');
    final codeStr = code.value.getOrElse(() => 'INVALID NAME');
    Map body = {
      'email': emailAddressStr,
      'password': passwordStr,
      'password_confirmation': passwordStr,
      'name': nameStr,
      'user_status': userStatus,
      'address':addressStr,
      'code':codeStr,
    };
    print("map=>${body}");
    try {
      return await _authRepository
          .registerUser(json.encode(body))
          .then((response) async {
        log("=->${response}");
        if (response.data['status_code'] == '422') {
          if (response.data['message'] == 'The email has already been taken') {
            return left(const AuthFailure.emailAlreadyInUse());
          } else {
            return left(const AuthFailure.serverError());
          }
        } else if (response.data['message'] == 'Successfully Created' ||
            response.data['success'].toString() == 'true') {
          final r = UserLogInResponse.fromJson(response.data);
          log("->${userStatus}");
          if (userStatus == 'institution') {
            try {
              await SharedPrefs.logIn(r);
              log("->${r.institution!.name}");
              UserDetailsLocal.set(
                r.token!,
                r.institution!.id.toString(),
                r.institution!.name!,
                r.institution!.email!,
                "","","","",
              );
            } catch (e) {
              toastMessage('Unexpected Response');
              log("shared pref ${e.toString()}");
            }
          }
          return right(r);
        } else {
          return left(const AuthFailure.serverError());
        }
      });
    } catch (e) {
      if (e.toString() == 'ERROR_EMAIL_ALREADY_IN_USE') {
        return left(const AuthFailure.emailAlreadyInUse());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }
  @override
  Future<Either<AuthFailure, UserLogInResponse>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
    required String? type
  }) async {
    final emailAddressStr = emailAddress.value.getOrElse(() => 'INVALID EMAIL');
    final passwordStr = password.value.getOrElse(() => 'INVALID PASSWORD');

    Map body = {
      'email': emailAddressStr,
      'password': passwordStr,
    };
    try {
      return await _authRepository
          .login(jsonEncode(body))
          .then((response) async {
        if (response.data['status'] == '401' ||
            response.data['status'] == 401) {
          if (response.data['message'] == 'Invalid credentials' ||
              response.data['message'] == 'Emailid is not valid') {
            return left(const AuthFailure.invalidEmailAndPasswordCombination());
          } else if (response.data['message'] == 'User not Approved') {
            return left(const AuthFailure.userVerificationPending());
          } else {
            return left(const AuthFailure.serverError());
          }
        } else if (response.data['success'].toString() == 'true' ||
            response.data['message'] == 'Loggined Successfully') {

          final r = UserLogInResponse.fromJson(response.data);
          print("school=>>>>>>>>>${response.data["school"]}");
          try {

            await SharedPrefs.logIn(r);

            if (response.data["type"]== "instructor") {
              log(("instructor->${r.token}"));
              UserDetailsLocal.set(
                  r.token!,
                  r.instructor!.id.toString(),
                  r.instructor!.name!,
                  r.instructor!.email!,
                  "","","","",
              );
            }
            else if(response.data["type"]== "institution"){
              log("{hg->}");
              UserDetailsLocal.set(
                r.token!,
                r.institution!.id.toString(),
                r.institution!.name!,
                r.institution!.email!,
                "","","","",
              );
            }
            else if(response.data["type"]== "school"){
              log("{hg->>${r.school}");
              print("=>>>>>>>>>${r.school?.id.toString()}");
              UserDetailsLocal.set(
                r.token!,
                r.school!.id.toString(),
                r.school!.name!,
                r.school!.email!,
                "","","","",
              );
            }
            else{
              log("{hg->>>}");
              log(("user->${r.token}"));
              UserDetailsLocal.set(
                  r.token!,
                  r.user!.id.toString(),
                  r.user!.name ?? '',
                  r.user!.email ?? '',"","","","",
              );

            }
          } catch (e) {
            log("error1 ${e.toString()}");
          }
          return right(r);
        } else {
          toastMessage('Unexpected Response');
          return left(const AuthFailure.serverError());
        }
      });
    } catch (e) {
      log("message");
      if (e.toString() == 'ERROR_WRONG_PASSWORD' ||
          e.toString() == 'ERROR_USER_NOT_FOUND') {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      }
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> verifyEduproUser({
    required String verificationCode,
    required String userId,
  }) async {
    Map body = {
      'verification_code': verificationCode,
      'user_id': userId,
    };
    try {
      return await _authRepository
          .verifyEduproUser(jsonEncode(body))
          .then((response) async {
        return right(unit);
      });
    } on DioError catch (err) {
      log(err.response!.data.toString());
      if (err.response?.data['message'] == 'Invalid code') {
        return left(const AuthFailure.verificationCodeinvalid());
      } else {
        return left(const AuthFailure.serverError());
      }
    } catch (e) {
      return left(const AuthFailure.serverError());
    }
  }

  // @override
  // Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
  //   try {
  //     final googleUser = await _googleSignIn.signIn();

  //     if (googleUser == null) {
  //       return left(const AuthFailure.cancelledByUser());
  //     }

  //     final googleAuthentication = await googleUser.authentication;
  //     final authCredential = GoogleAuthProvider.getCredential(
  //       accessToken: googleAuthentication.accessToken,
  //       idToken: googleAuthentication.idToken,
  //     );
  //     return _firebaseAuth
  //         .signInWithCredential(authCredential)
  //         .then((r) => right(unit));
  //   } on PlatformException catch (_) {
  //     return left(const AuthFailure.serverError());
  //   }
  // }

  @override
  Future<void> signOut() async {
    SharedPrefs.logOut();
  }
}