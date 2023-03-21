import 'package:another_flushbar/flushbar_helper.dart';
import 'package:pgs_edupro/application/profile/profile_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class InstructorChangePasswordForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const InstructorChangePasswordForm({super.key, required this.formKey});

  @override
  State<InstructorChangePasswordForm> createState() => _InstructorChangePasswordFormState();
}

class _InstructorChangePasswordFormState extends State<InstructorChangePasswordForm> {
  bool obscureText1 = true;
  bool obscureText2 = true;
  bool obscureText3 = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        state.changePasswordFailedOrSuccessOption.fold(() {}, (either) {
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
                  .show(context)
                  .then((value) => Get.back()));
        });
      },
      builder: (context, state) {
        return Form(
          key: widget.formKey,
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(15),
            children: <Widget>[
              thickSpace,
              Text(
                "Old Password",
                style: boldValue,
              ),
              thickSpace,
              TextFormField(
                onChanged: (v) => context
                    .read<ProfileBloc>()
                    .add(ProfileEvent.oldPasswordChanged(v)),
                // validator: (_) =>
                //     context.read<ProfileBloc>().state.password.value.fold(
                //           (f) => f.maybeMap(
                //             shortPassword: (_) => 'Short password',
                //             orElse: () => null,
                //           ),
                //           (_) => null,
                //         ),
                obscureText: obscureText1,
                keyboardType: TextInputType.visiblePassword,
                style: const TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.black87),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(right: 8, left: 8),
                  suffix: GestureDetector(
                    onTap: () {
                      obscureText1 = !obscureText1;
                      setState(() {});
                    },
                    child: obscureText1
                        ? const Icon(
                      Icons.visibility,
                      color: Colors.black,
                    )
                        : const Icon(
                      Icons.visibility_off,
                      color: Colors.black,
                    ),
                  ),
                  hintText: "Old Password",
                  hintStyle: TextStyle(color: primaryColor[200]),
                  filled: true,
                  fillColor: primaryColor[100],
                  prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Icon(Icons.lock)),
                ),
              ),
              thickSpace,
              thickSpace,
              Text(
                "New Password",
                style: boldValue,
              ),
              thickSpace,
              TextFormField(
                onChanged: (v) => context
                    .read<ProfileBloc>()
                    .add(ProfileEvent.passwordChanged(v)),
                validator: (_) =>
                    context.read<ProfileBloc>().state.password.value.fold(
                          (f) => f.maybeMap(
                        shortPassword: (_) => 'Invalid Password',
                        orElse: () => null,
                      ),
                          (_) => null,
                    ),
                obscureText: obscureText2,
                keyboardType: TextInputType.visiblePassword,
                style: const TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.black87),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(right: 8, left: 8),
                  suffix: GestureDetector(
                    onTap: () {
                      obscureText2 = !obscureText2;
                      setState(() {});
                    },
                    child: obscureText2
                        ? const Icon(
                      Icons.visibility,
                      color: Colors.black,
                    )
                        : const Icon(
                      Icons.visibility_off,
                      color: Colors.black,
                    ),
                  ),
                  hintText: "New Password",
                  hintStyle: TextStyle(color: primaryColor[200]),
                  filled: true,
                  fillColor: primaryColor[100],
                  prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Icon(Icons.lock)),
                ),
              ),
              thickSpace,
              thickSpace,
              Text(
                "Confirm",
                style: boldValue,
              ),
              thickSpace,
              TextFormField(
                onChanged: (v) => context
                    .read<ProfileBloc>()
                    .add(ProfileEvent.confirmPasswordChanged(v)),
                validator: (v) =>
                v.toString() != state.password.value.getOrElse(() => 'x')
                    ? "Password Do Not Match"
                    : null,
                obscureText: obscureText3,
                keyboardType: TextInputType.visiblePassword,
                style: const TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.black87),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(right: 8, left: 8),
                  suffix: GestureDetector(
                    onTap: () {
                      obscureText3 = !obscureText3;
                      setState(() {});
                    },
                    child: obscureText3
                        ? const Icon(
                      Icons.visibility,
                      color: Colors.black,
                    )
                        : const Icon(
                      Icons.visibility_off,
                      color: Colors.black,
                    ),
                  ),
                  hintText: "Confirm Password",
                  hintStyle: TextStyle(color: primaryColor[200]),
                  filled: true,
                  fillColor: primaryColor[100],
                  prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Icon(Icons.lock)),
                ),
              ),
              thickSpace,
              thickSpace,
              thickSpace,
              thickSpace,
              thickSpace,
              thickSpace,
              SizedBox(
                height: 50,
                width: screenWidth,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: ElevatedButton(
                    onPressed: () {
                      if (widget.formKey.currentState!.validate()) {
                        context.read<ProfileBloc>().add(
                            const ProfileEvent.confirmChangePasswordPressed());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 4,
                    ),
                    child: const Text('Confirm Change Password'),
                  ),
                ),
              ),
              if (state.isSubmitting) ...[
                const SizedBox(height: 8),
                const LinearProgressIndicator(value: null),
              ]
            ],
          ),
        );
      },
    );
  }
}
