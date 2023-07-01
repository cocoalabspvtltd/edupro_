 part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.enableEdit() = _EnableEdit;
  const factory ProfileEvent.nameChanged(String nameStr) = _NameChanged;
  const factory ProfileEvent.emailChanged(String emailStr) = _EmailChanged;
  const factory ProfileEvent.phoneNumberChanged(String phoneNumberStr) =
      _PhoneNumberChanged;
  const factory ProfileEvent.dobChanged(String dobStr) = _DobChanged;
  const factory ProfileEvent.addressChanged(String addressStr) =
      _AddressChanged;
  const factory ProfileEvent.oldPasswordChanged(String oldPasswordStr) =
      _OldPasswordChanged;
  const factory ProfileEvent.passwordChanged(String passwordStr) =
      _PasswordChanged;
  const factory ProfileEvent.confirmPasswordChanged(String conPasswordStr) =
      _ConfirmPasswordChanged;

  const factory ProfileEvent.loadMyProfile(int userId) = _LoadMyProfile;
  const factory ProfileEvent.saveAndUpdatePressed() = _SaveAndUpdatePressed;
  const factory ProfileEvent.updateDisplayPicture(File displayPicture) =
      _UpdateDisplayPicture;
  const factory ProfileEvent.confirmChangePasswordPressed() =
      _ConfirmChangePasswordPressed;
}
