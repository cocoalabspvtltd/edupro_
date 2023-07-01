import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:pgs_edupro/domain/auth/auth_failure.dart';
import 'package:pgs_edupro/domain/auth/i_auth_facade.dart';
import 'package:pgs_edupro/domain/auth/value_objects.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/shared_prefs.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/auth/user_login_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_in_event.dart';
part 'log_in_state.dart';
part'log_in_bloc.freezed.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  final IAuthFacade? authFacade;

  LogInBloc({this.authFacade}) : super(LogInState.initial()) {
    on<LogInEvent>((event, emit) async {
      if (event is EmailChanged) {
        emit(state.copyWith(
          emailAddress: EmailAddress(event.emailStr),
          authFailureOrSuccessOption: none(),
        ));
      }

      if (event is PasswordChanged) {
        emit(state.copyWith(
          password: Password(event.passwordStr),
          authFailureOrSuccessOption: none(),
        ));
      }

      if (event is SignInWithEmailAndPasswordPressed) {
        Either<AuthFailure, UserLogInResponse>? failureOrSuccess;

        final isEmailValid = state.emailAddress.isValid();
        final isPasswordValid = state.password.isValid();

        if (isEmailValid && isPasswordValid) {
          emit(state.copyWith(
            isSubmitting: true,
            authFailureOrSuccessOption: none(),
          ));

          failureOrSuccess = await authFacade!.signInWithEmailAndPassword(
              emailAddress: state.emailAddress,
              password: state.password,
              // type : state.userStatus,
              type :UserDetailsLocal.type

          );
          print("type->${UserDetailsLocal.type}");
        }

        failureOrSuccess?.fold((l) => null,
            ((r) => emit(state.copyWith(userStatus: r.type!))));

        emit(state.copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          authFailureOrSuccessOption: optionOf(failureOrSuccess),
        ));
      }

      if (event is RegisterPressed) {
        final isEmailValid = state.emailAddress.isValid();
        final isPasswordValid = state.password.isValid();
        log(state.emailAddress.value.toString());
        if (isEmailValid && isPasswordValid) {
          emit(state.copyWith(
              emailAddress: state.emailAddress,
              password: state.password,
              showErrorMessages: false));
          return;
        }
        emit(state.copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          authFailureOrSuccessOption: none(),
        ));
      }

      if (event is NameChanged) {
        emit(state.copyWith(
          name: Name(event.nameStr),
          authFailureOrSuccessOption: none(),
        ));
      }

      if (event is QualificationChanged) {
        emit(state.copyWith(
          qualification: Qualification(event.qualiStr),
          authFailureOrSuccessOption: none(),
        ));
      }

      if (event is AddressChanged) {
        emit(state.copyWith(
          address: Address(event.addressStr),
          authFailureOrSuccessOption: none(),
        ));
      }

      if (event is CodeChanged) {
        emit(state.copyWith(
          code: Code(event.codeStr),
          authFailureOrSuccessOption: none(),
        ));
      }

      if (event is ConfirmPasswordChanged) {
        emit(state.copyWith(
          confirmPassword: Password(event.conPasswordStr),
          authFailureOrSuccessOption: none(),
        ));
      }

      if (event is UserStatusChanged) {
        emit(state.copyWith(
          userStatus: event.userStatusStr,
          authFailureOrSuccessOption: none(),
        ));
        log(event.userStatusStr);
      }

      if (event is RegisterWithEmailAndPasswordPressed) {
        Either<AuthFailure, UserLogInResponse>? failureOrSuccess;
        final isEmailValid = state.emailAddress.isValid();
        final isPasswordValid = state.password.isValid();
        final isNameValid = state.name.isValid();
        log(isEmailValid.toString());
        log(isNameValid.toString());

        if (isEmailValid && isPasswordValid && isNameValid) {
          emit(state.copyWith(
            isSubmitting: true,
            authFailureOrSuccessOption: none(),
          ));

          failureOrSuccess = await authFacade!.registerWithEmailAndPassword(
              emailAddress: state.emailAddress,
              password: state.password,
              confirmPassword: state.confirmPassword,
              name: state.name,
              userStatus: state.userStatus);
        }

        emit(state.copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          authFailureOrSuccessOption: optionOf(failureOrSuccess),
        ));
      }
      if (event is RegisterWithInstructorEmailAndPasswordPressed) {
        Either<AuthFailure, UserLogInResponse>? failureOrSuccess;
        final isEmailValid = state.emailAddress.isValid();
        final isPasswordValid = state.password.isValid();
        final isNameValid = state.name.isValid();
        log(isEmailValid.toString());
        log(isNameValid.toString());

        if (isEmailValid && isPasswordValid && isNameValid) {
          emit(state.copyWith(
            isSubmitting: true,
            authFailureOrSuccessOption: none(),
          ));

          failureOrSuccess = await authFacade!.registerWithInstructorEmailAndPassword(
              emailAddress: state.emailAddress,
              password: state.password,
              confirmPassword: state.confirmPassword,
              name: state.name,
              userStatus:"individual_instructor" ,
              quali: state.qualification


          );
        }
        failureOrSuccess?.fold((l) => null,
            ((r) => emit(state.copyWith(userStatus: r.message!))));
        emit(state.copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          authFailureOrSuccessOption: optionOf(failureOrSuccess),
        ));
      }
      if (event is RegisterWithInstitutionEmailAndPasswordPressed) {
        Either<AuthFailure, UserLogInResponse>? failureOrSuccess;
        final isEmailValid = state.emailAddress.isValid();
        final isPasswordValid = state.password.isValid();
        final isNameValid = state.name.isValid();
        log(isEmailValid.toString());
        log(isNameValid.toString());

        if (isEmailValid && isPasswordValid && isNameValid) {
          emit(state.copyWith(
            isSubmitting: true,
            authFailureOrSuccessOption: none(),
          ));

          failureOrSuccess = await authFacade!.registerWithInstitutionEmailAndPassword(
            emailAddress: state.emailAddress,
            password: state.password,
            confirmPassword: state.confirmPassword,
            name: state.name,
            userStatus:"institution" ,
            code:state.code,
            address:state.address,

          );
        }
        failureOrSuccess?.fold((l) => null,
            ((r) => emit(state.copyWith(userStatus: r.message!))));
        emit(state.copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          authFailureOrSuccessOption: optionOf(failureOrSuccess),
        ));
      }
      if (event is VerificationCodeChanged) {
        emit(state.copyWith(
            verificationCode: event.verificationCode,
            verifyFailureOrSuccessOption: none()));
      }

      if (event is VerifyEduproUser) {
        await SharedPrefs.init();
        Either<AuthFailure, Unit>? failureOrSuccess;
        String userId = SharedPrefs.getString('spUserId');

        if (userId != '' && state.verificationCode != null) {
          emit(state.copyWith(
            isSubmitting: true,
            authFailureOrSuccessOption: none(),
          ));

          failureOrSuccess = await authFacade!.verifyEduproUser(
              userId: userId,
              verificationCode: state.verificationCode.toString());
        }

        failureOrSuccess?.fold(
              (l) => null,
              (r) {
            SharedPrefs.setString('spUserStatus', "Verified");
          },
        );

        emit(state.copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          verifyFailureOrSuccessOption: optionOf(failureOrSuccess),
        ));
      }
    });
  }
}