part of 'log_in_bloc.dart';

@freezed
class LogInEvent with _$LogInEvent {
  const factory LogInEvent.emailChanged(String emailStr) = EmailChanged;
  const factory LogInEvent.passwordChanged(String passwordStr) =
      PasswordChanged;
  const factory LogInEvent.registerPressed() = RegisterPressed;
  const factory LogInEvent.nameChanged(String nameStr) = NameChanged;
  const factory LogInEvent.qualificationChanged(String qualiStr) = QualificationChanged;
  const factory LogInEvent.addressChanged(String addressStr) = AddressChanged;
  const factory LogInEvent.codeChanged(String codeStr) = CodeChanged;
  const factory LogInEvent.confirmPasswordChanged(String conPasswordStr) =
      ConfirmPasswordChanged;
  const factory LogInEvent.userStatusChanged(String userStatusStr) =
      UserStatusChanged;
  const factory LogInEvent.verificationCodeChanged(int verificationCode) =
      VerificationCodeChanged;
  const factory LogInEvent.registerWithEmailAndPasswordPressed() =
      RegisterWithEmailAndPasswordPressed;
  const factory LogInEvent.registerWithInstructorEmailAndPasswordPressed(String userStatus) =
  RegisterWithInstructorEmailAndPasswordPressed;
  const factory LogInEvent.registerWithInstitutionEmailAndPasswordPressed(String userStatus) =
  RegisterWithInstitutionEmailAndPasswordPressed;
  const factory LogInEvent.signInWithEmailAndPasswordPressed() =
      SignInWithEmailAndPasswordPressed;
  const factory LogInEvent.verifyEduproUser() = VerifyEduproUser;
  //const factory LogInEvent.signInWithGooglePressed() = SignInWithGooglePressed;
}
