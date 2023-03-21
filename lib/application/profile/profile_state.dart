part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    required EmailAddress emailAddress,
    required Password oldPassword,
    required Password password,
    required Password confirmPassword,
    required Name name,
    required PhoneNumber phoneNumber,
    required DateFormatted? dob,
    required String address,
    required File? displayPicture,
    required bool showErrorMessages,
    required bool isLoading,
    required bool isSubmitting,
    required String displayImageUrl,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController phoneNumberController,
    required DateTime? dobDT,
    required TextEditingController addressController,
    required bool enableEdit,
    required Option<Either<NetworkFailure, MyProfileResponse>>
        loadFailureOrSuccessOption,
    required Option<Either<NetworkFailure, MyProfileResponse>>
        submitFailedOrSuccessOption,
    required Option<Either<NetworkFailure, CommonResponse>>
        changePasswordFailedOrSuccessOption,
  }) = _ProfileState;

  factory ProfileState.initial() => ProfileState(
        emailAddress: EmailAddress(''),
        password: Password(''),
        confirmPassword: Password(''),
        oldPassword: Password(''),
        name: Name(''),
        phoneNumber: PhoneNumber(''),
        dob: null,
        address: '',
        displayPicture: null,
        showErrorMessages: false,
        isLoading: false,
        isSubmitting: false,
        enableEdit: false,
        loadFailureOrSuccessOption: none(),
        submitFailedOrSuccessOption: none(),
        changePasswordFailedOrSuccessOption: none(),
        nameController: TextEditingController(),
        addressController: TextEditingController(),
        dobDT: null,
        emailController: TextEditingController(),
        phoneNumberController: TextEditingController(),
        displayImageUrl: '',
      );
}
