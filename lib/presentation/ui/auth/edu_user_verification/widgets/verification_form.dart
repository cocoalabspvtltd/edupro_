import 'dart:developer';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:pgs_edupro/application/auth/auth_bloc.dart';
import 'package:pgs_edupro/application/auth/login_bloc/log_in_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/presentation/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class VerificationForm extends StatelessWidget {
  final GlobalKey<FormState>? formKey;
  const VerificationForm({super.key, this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogInBloc, LogInState>(
      listener: (context, state) {
        state.verifyFailureOrSuccessOption.fold(
          () {},
          (either) {
            either.fold(
              (failure) {
                FlushbarHelper.createError(
                  message: failure.map(
                    // Use localized strings here in your apps
                    cancelledByUser: (_) => 'Cancelled',
                    serverError: (_) => 'Server error',
                    emailAlreadyInUse: (_) => 'Email already in use',
                    invalidEmailAndPasswordCombination: (_) =>
                        'Invalid email and password combination',
                    userVerificationPending: (_) => 'User not verified',
                    userVerificationFailed: (_) => '',
                    verificationCodeinvalid: (_) => 'Wrong Verification Code',
                  ),
                ).show(context);
              },
              (_) {
                Get.offAll(() => const HomeScreen());
                context
                    .read<AuthBloc>()
                    .add(const AuthEvent.authCheckRequested());
              },
            );
          },
        );
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(15),
            children: <Widget>[
              SizedBox(height: screenHeight * .08),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.verified_outlined),
                  labelText: 'Verification Code',
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                inputFormatters: [LengthLimitingTextInputFormatter(5)],
                autocorrect: false,
                onChanged: (value) => context
                    .read<LogInBloc>()
                    .add(LogInEvent.verificationCodeChanged(int.parse(value))),
                validator: (value) {
                  return value?.length != 5
                      ? 'Enter Valid Verification Code (5 digits)'
                      : null;
                },
              ),
              const SizedBox(height: 25),
              const SizedBox(height: 25),
              SizedBox(
                height: 50,
                width: screenWidth,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formKey!.currentState!.validate()) {
                        log("message");
                        context
                            .read<LogInBloc>()
                            .add(const LogInEvent.verifyEduproUser());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: const Text('VERIFY'),
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
