import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pgs_edupro/domain/auth/value_objects.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/domain/profile/i_profile_repository.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/shared_prefs.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/common_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/profile/get_my_profile_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final IProfileRepository profileRepository;
  ProfileBloc(this.profileRepository) : super(ProfileState.initial()) {
    print("dcxs=>${UserDetailsLocal.apiToken}");
    on<_LoadMyProfile>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          submitFailedOrSuccessOption: none(),
          changePasswordFailedOrSuccessOption: none(),
          loadFailureOrSuccessOption: none(),
        ),
      );

      Either<NetworkFailure, MyProfileResponse> failureOrSuccess;

      failureOrSuccess = await profileRepository.getMyProfile(event.userId);

      failureOrSuccess.fold((l) => null, ((r) async {
        User user = r.user!;

        emit(
          state.copyWith(
              displayImageUrl: user.profilePhoto ?? '',
              name: Name(user.name ?? ''),
              emailAddress: EmailAddress(user.email ?? ''),
              phoneNumber: PhoneNumber(user.phoneNumber ?? ''),
              dob: user.dob == null
                  ? null
                  : DateFormatted(DateFormat("MM/dd/yyyy")
                      .format(DateTime.parse(user.dob!))),
              address: user.address ?? '',
              nameController: TextEditingController(text: user.name),
              emailController: TextEditingController(text: user.email),
              phoneNumberController:
                  TextEditingController(text: user.phoneNumber),
              dobDT: user.dob != null ? DateTime.parse(user.dob!) : null,
              addressController: TextEditingController(text: user.address)),
        );
        await SharedPrefs.init();
        print("data->${UserDetailsLocal.apiToken}");
        SharedPrefs.setData(r);
      }));

      emit(state.copyWith(
          isLoading: false,
          loadFailureOrSuccessOption: optionOf(failureOrSuccess)));
    });

    on<_EnableEdit>((event, emit) {
      state.enableEdit
          ? emit(state.copyWith(
              enableEdit: false,
              submitFailedOrSuccessOption: none(),
              loadFailureOrSuccessOption: none(),
              changePasswordFailedOrSuccessOption: none(),
            ))
          : emit(state.copyWith(
              enableEdit: true,
              submitFailedOrSuccessOption: none(),
              loadFailureOrSuccessOption: none(),
              changePasswordFailedOrSuccessOption: none(),
            ));
    });

    on<_NameChanged>((event, emit) {
      emit(state.copyWith(
        name: Name(event.nameStr),
        submitFailedOrSuccessOption: none(),
      ));
    });

    on<_PhoneNumberChanged>((event, emit) {
      emit(state.copyWith(
        phoneNumber: PhoneNumber(event.phoneNumberStr),
        submitFailedOrSuccessOption: none(),
      ));
    });

    on<_DobChanged>((event, emit) {
      emit(state.copyWith(
        dob: DateFormatted(event.dobStr),
        submitFailedOrSuccessOption: none(),
      ));
    });

    on<_AddressChanged>((event, emit) {
      emit(state.copyWith(
        address: event.addressStr,
        submitFailedOrSuccessOption: none(),
      ));
    }
    );

    on<_SaveAndUpdatePressed>((event, emit) async {
      final isEmailValid = state.emailAddress.isValid();
      final isNameValid = state.name.isValid();
      // final isPhoneNumberValid = state.phoneNumber.isValid();
      // final isDobValid = state.dob?.isValid();
      // final isAddressValid = state.address != '' ? true : false;

      Either<NetworkFailure, MyProfileResponse>? failureOrSuccess;
      // if (!isPhoneNumberValid) {
      //   toastMessage("Enter 10 Digit Valid Phone Number");
      // }
      // if (isDobValid != true) {
      //   toastMessage("Select Date of Birth");
      // }
      // if (!isAddressValid) {
      //   toastMessage("Enter Valid Address");
      // }

      if (isNameValid && isEmailValid) {
        emit(
          state.copyWith(
            showErrorMessages: false,
            isSubmitting: true,
            submitFailedOrSuccessOption: none(),
          ),
        );
        print("UserId------>>>${UserDetailsLocal.userId}");
        Map body = {
          "user_id": UserDetailsLocal.userId,
          "name": state.name.value.getOrElse(() => ''),
          "email": state.emailAddress.value.getOrElse(() => ''),
          "phone_number": state.phoneNumber.value.getOrElse(() => ''),
          "dob": state.dob?.value.getOrElse(() => ''),
          "address": state.address
        };
        //AppDialogs.loading();
        failureOrSuccess = await profileRepository.editMyProfile(body);
        //getx.Get.back();
      }

      failureOrSuccess?.fold((l) => null, ((r) async {
        await SharedPrefs.init();
        SharedPrefs.setData(r);
        //emit(state.copyWith(enableEdit: false));
      }));

      emit(state.copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          enableEdit: false,
          submitFailedOrSuccessOption: optionOf(failureOrSuccess)));
    });

    on<_UpdateDisplayPicture>((event, emit) async {
      emit(
        state.copyWith(
          isSubmitting: true,
          displayPicture: event.displayPicture,
          submitFailedOrSuccessOption: none(),
                   ),
      );
      String fileName = state.displayPicture!.path.split('/').last;
      print("Filename--->${await MultipartFile.fromFile(
          state.displayPicture!.path,
          filename: fileName)}");
      print("token->${UserDetailsLocal.apiToken}");

      FormData body = FormData.fromMap({
        "user_id": UserDetailsLocal.userId,
        "profile_photo": await MultipartFile.fromFile(
            state.displayPicture!.path,
            filename: fileName),
      });
      print("dataa-->${body.fields}");
      Either<NetworkFailure, MyProfileResponse>? failureOrSuccess;

      //  AppDialogs.loading();
      toastMessage("Profile being uploaded..");
      failureOrSuccess = await profileRepository.updateDisplayPicture(body);
      // getx.Get.back();;

      failureOrSuccess.fold((l) => null, ((r) async {
        emit(state.copyWith(
          displayImageUrl: r.user?.profilePhoto ?? '',

        ));
        await SharedPrefs.init();
        SharedPrefs.setData(r);
      }));

      emit(state.copyWith(
          isSubmitting: false,
          submitFailedOrSuccessOption: optionOf(failureOrSuccess)));
    });

    on<_PasswordChanged>((event, emit) => emit(
          state.copyWith(
              submitFailedOrSuccessOption: none(),
              changePasswordFailedOrSuccessOption: none(),
              loadFailureOrSuccessOption: none(),
              password: Password(event.passwordStr)),
        ));

    on<_OldPasswordChanged>((event, emit) => emit(
          state.copyWith(
              submitFailedOrSuccessOption: none(),
              changePasswordFailedOrSuccessOption: none(),
              loadFailureOrSuccessOption: none(),
              oldPassword: Password(event.oldPasswordStr)),
        ));

    on<_ConfirmPasswordChanged>((event, emit) => emit(
          state.copyWith(
              submitFailedOrSuccessOption: none(),
              changePasswordFailedOrSuccessOption: none(),
              loadFailureOrSuccessOption: none(),
              confirmPassword: Password(event.conPasswordStr)),
        ));

    on<_ConfirmChangePasswordPressed>((event, emit) async {
      Either<NetworkFailure, CommonResponse>? failureOrSuccess;

      final isPasswordValid = state.password.isValid();
      final isOldPasswordValid = state.oldPassword.isValid();

      if (!isPasswordValid && !isOldPasswordValid) {
        emit(
          state.copyWith(
            isSubmitting: false,
            showErrorMessages: true,
            changePasswordFailedOrSuccessOption: none(),
          ),
        );
        return;
      }

      Map body = {
        "user_id": UserDetailsLocal.userId,
        "old_password": '123456', //tate.oldPassword.value.getOrElse(() => ''),
        "new_password": state.password.value.getOrElse(() => ''),
        "new_password_confirmation":
            state.confirmPassword.value.getOrElse(() => ''),
      };

      //AppDialogs.loading();
      //  toastMessage("Profile being uploaded..");
      failureOrSuccess = await profileRepository.changePassword(body);
      // getx.Get.back();

      emit(state.copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          changePasswordFailedOrSuccessOption: optionOf(failureOrSuccess)));
    });
  }
}
