import 'package:another_flushbar/flushbar_helper.dart';
import 'package:date_field/date_field.dart';
import 'package:pgs_edupro/application/profile/profile_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/presentation/ui/profile/change_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    print("token${UserDetailsLocal.apiToken}");
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        state.loadFailureOrSuccessOption.fold(
          () {},
          (either) {
            either.fold(
              (failure) {
                FlushbarHelper.createError(
                  message: failure.map(
                    unexpected: (value) => 'Unexpected Error',
                    serverError: (value) => 'Server Error',
                    serverTimeOut: (value) => 'Server Timed Out',
                    unAuthorized: (value) => value.message,
                    nullData: (value) => 'Data Not Found',
                  ),
                ).show(context);
              },
              (res) {},
            );
          },
        );
        state.submitFailedOrSuccessOption.fold(() {}, (either) {
          either.fold((failure) {
            FlushbarHelper.createError(
              message: failure.map(
                unexpected: (value) => 'Unexpected Error',
                serverError: (value) => 'Server Error',
                serverTimeOut: (value) => 'Server Timed Out',
                unAuthorized: (value) => value.message,
                nullData: (value) => 'Data Not Found',
              ),
            ).show(context);
          },
              (r) => FlushbarHelper.createSuccess(message: r.message ?? '')
                  .show(context));
        });
      },
      builder: (context, state) {
        print("Name-->${state.name}");
        print("emailAddress-->${state.emailAddress}");
        print("dob-->${state.dob}");
        return state.isLoading
            ? SizedBox(
                height: screenHeight - 180,
                child: const Center(child: CircularProgressIndicator()),
              )
            : Form(
                // key: _formKey,
                autovalidateMode: state.showErrorMessages
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(15),
                  children: <Widget>[
                    if (state.enableEdit) ...[
                      _textForm(
                        state.nameController,
                        (v) => context
                            .read<ProfileBloc>()
                            .add(ProfileEvent.nameChanged(v)),
                        (_) =>
                            context.read<ProfileBloc>().state.name.value.fold(
                                  (f) => f.maybeMap(
                                    invalidName: (_) => 'Invalid Name',
                                    orElse: () => null,
                                  ),
                                  (_) => null,
                                ),
                        "Name",
                        'assets/icons/profile_icons/person.png',
                        state.enableEdit,
                        TextInputType.name,
                        formatter: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z\s]')),
                        ],
                      ),
                      thickSpace,
                      thickSpace,
                      // _textForm(
                      //     state.emailController,
                      //     (v) => context
                      //         .read<ProfileBloc>()
                      //         .add(ProfileEvent.emailChanged(v)),
                      //     (_) => context
                      //         .read<ProfileBloc>()
                      //         .state
                      //         .emailAddress
                      //         .value
                      //         .fold(
                      //           (f) => f.maybeMap(
                      //             invalidEmail: (_) => 'Invalid Email',
                      //             orElse: () => null,
                      //           ),
                      //           (_) => null,
                      //         ),
                      //     "Email Address",
                      //     'assets/icons/profile_icons/mail.png',
                      //     false,
                      //     TextInputType.emailAddress),
                      //thickSpace,
                      //thickSpace,
                    ],
                    _textForm(
                      state.phoneNumberController,
                      (v) => context
                          .read<ProfileBloc>()
                          .add(ProfileEvent.phoneNumberChanged(v)),
                      (_) => context
                          .read<ProfileBloc>()
                          .state
                          .phoneNumber
                          .value
                          .fold(
                            (f) => f.maybeMap(
                              invalidPhoneNumber: (_) => 'Invalid Phone Number',
                              orElse: () => null,
                            ),
                            (_) => null,
                          ),
                      "Phone Number",
                      'assets/icons/profile_icons/phone.png',
                      state.enableEdit,
                      TextInputType.number,
                      formatter: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                    ),
                    thickSpace,
                    thickSpace,
                    Text(
                      "Date of Birth",
                      style: boldValue,
                    ),
                    thickSpace,
                    DateTimeFormField(
                      initialValue: state.dobDT,
                      dateTextStyle: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 15),
                      enabled: state.enableEdit,
                      //dateFormat: DateFormat.yMd(),
                      decoration: InputDecoration(
                        //filled: true,
                        fillColor: primaryColor[100],
                        prefixIcon: Image.asset(state.enableEdit
                            ? 'assets/icons/profile_icons/calender_theme.png'
                            : 'assets/icons/profile_icons/calender.png'),
                        prefixIconConstraints: const BoxConstraints(
                          maxHeight: 30,
                          minHeight: 30,
                          maxWidth: 50,
                          minWidth: 50,
                        ),
                        hintStyle: TextStyle(color: primaryColor[200]),
                        border: const OutlineInputBorder(),
                        suffixIcon: const Icon(Icons.event_note),

                        enabledBorder: state.enableEdit
                            ? OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: primaryColor, width: 2))
                            : OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: primaryColor[100]!)),
                      ),
                      mode: DateTimeFieldPickerMode.date,
                      //firstDate: DateTime.now().add(const Duration(days: 10)),
                      lastDate: DateTime.now().add(const Duration(days: 40)),
                      // initialDate:
                      //     DateTime.now().add(const Duration(days: 20)),
                      autovalidateMode: AutovalidateMode.always,
                      onDateSelected: (DateTime value) => context
                          .read<ProfileBloc>()
                          .add(ProfileEvent.dobChanged(
                              DateFormat("MM/dd/yyyy").format(value))),
                    ),
                    thickSpace,
                    thickSpace,
                    _textForm(
                        state.addressController,
                        (v) => context
                            .read<ProfileBloc>()
                            .add(ProfileEvent.addressChanged(v)),
                        null,
                        "Address",
                        'assets/icons/profile_icons/location.png',
                        state.enableEdit,
                        TextInputType.streetAddress,
                        maxLine: 2),
                    thickSpace,
                    thickSpace,
                    thickSpace,
                    SizedBox(
                      height: 50,
                      width: screenWidth / 2 - 20,
                      child: ElevatedButton(
                        onPressed: !state.enableEdit
                            ? null
                            : () => context
                                .read<ProfileBloc>()
                                .add(const ProfileEvent.saveAndUpdatePressed()),
                        style: ElevatedButton.styleFrom(
                            elevation: 4, disabledBackgroundColor: Colors.grey
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(50),
                            //),
                            ),
                        child: const Text('Save And Update'),
                      ),
                    ),
                    thickSpace,
                    thickSpace,
                    SizedBox(
                      width: screenWidth / 2 - 20,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => ChangePasswordScreen());
                          },
                          child: const Text("Change Password")),
                    ),
                    if (state.isSubmitting) ...[
                      const SizedBox(height: 8),
                      const LinearProgressIndicator(value: null),
                    ],
                    thickSpace,
                    thickSpace,
                  ],
                ),
              );
      },
    );
  }

  Widget _textForm(
    TextEditingController controller,
    onChanged,
    validator,
    String label,
    String prefixIconAssetPath,
    bool editable,
    TextInputType keyboardType, {
    List<TextInputFormatter>? formatter,
    String? hint,
    int maxLine = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: boldValue,
        ),
        thickSpace,
        TextFormField(
          enabled: editable,
          controller: controller,
          maxLines: maxLine,
          onChanged: onChanged,
          validator: validator,
          keyboardType: keyboardType,
          inputFormatters: formatter,
          style: const TextStyle(
              fontWeight: FontWeight.w500, color: Colors.black87),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: primaryColor[200]),
            //filled: true,
            fillColor: primaryColor[100],
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Image.asset(
                editable
                    ? "${prefixIconAssetPath.split('.').first}_theme.png"
                    : prefixIconAssetPath,
              ),
            ),
            prefixIconConstraints: const BoxConstraints(
              maxHeight: 30,
              minHeight: 30,
              maxWidth: 50,
              minWidth: 50,
            ),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor[100]!)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor, width: 2)),
          ),
        ),
      ],
    );
  }
}
