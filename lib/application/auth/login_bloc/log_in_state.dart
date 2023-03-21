part of 'log_in_bloc.dart';

@freezed
class LogInState with _$LogInState {
  const factory LogInState({
    required EmailAddress emailAddress,
    required Password password,
    required Name name,
    required Password confirmPassword,
    required String userStatus,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<AuthFailure, UserLogInResponse>>
        authFailureOrSuccessOption,
    required int? verificationCode,
    required Option<Either<AuthFailure, Unit>> verifyFailureOrSuccessOption,
  }) = _LogInState;

  factory LogInState.initial() => LogInState(
        emailAddress: EmailAddress(''),
        password: Password(''),
        name: Name(''),
        confirmPassword: Password(''),
        userStatus: 'new_user',
        showErrorMessages: false,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
        verificationCode: null,
        verifyFailureOrSuccessOption: none(),
      );
}
