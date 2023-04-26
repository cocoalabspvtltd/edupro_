import 'package:another_flushbar/flushbar_helper.dart';
import 'package:pgs_edupro/application/auth/auth_bloc.dart';
import 'package:pgs_edupro/application/auth/login_bloc/log_in_bloc.dart';
import 'package:pgs_edupro/application/payment/payment_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/presentation/ui/auth/register/widgets/registration_edu_user_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pgs_edupro/presentation/ui/membership_check_screen.dart';
import 'package:toggle_switch/toggle_switch.dart';

class RegistrationForm extends StatefulWidget {
  final GlobalKey<FormState>? formKey;
  const RegistrationForm({super.key, this.formKey});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final formKey = GlobalKey<FormState>();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentBloc, PaymentState>(
      listener: (context, state) {
        state.getPaymentSuccessOrFailureOption.fold(() {}, (either) {
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
          }, (r) {});
        });
      },
      builder: (context, state) {
        return BlocConsumer<LogInBloc, LogInState>(
          listener: (context, state) {
            state.authFailureOrSuccessOption.fold(
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
                        verificationCodeinvalid: (_) => '',
                      ),
                    ).show(context);
                  },
                  (_) async {
                    if (state.userStatus == 'new_user') {
                      Get.offAll(() => const MembershipCheckScreen());
                      Get.dialog(
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(12),
                              child: Padding(
                                padding: const EdgeInsets.all(22),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.check_box_rounded,
                                      color: Colors.green.shade300,
                                      size: 70,
                                    ),
                                    const SizedBox(height: 16),
                                    const Text(
                                      "You are on 30 days trail, After trial do payment to use complete features of app",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // transitionDuration: const Duration(seconds: 3),
                      );
                      //await _startPay(1500);
                      // String paymentType = 'REGISTRATION';
                      // context.read<PaymentBloc>().add(
                      //       PaymentEvent.startPayment(
                      //         '1500',
                      //         paymentType,
                      //       ),
                      //     );
                    }
                    if (state.userStatus == 'edu_user') {
                      Get.to(() => const RegistrationEduUserMessage());
                      context
                          .read<AuthBloc>()
                          .add(const AuthEvent.authCheckRequested());
                    }

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
                padding: const EdgeInsets.all(15.0),
                children: <Widget>[
                  SizedBox(height: screenHeight * .08),
                  Container( decoration: BoxDecoration(
                      color: Colors.white,
                      //border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.fromLTRB(20,10, 20, 10),
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
                    child: Column(
                      children: [
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: 'Name',
                          ),
                          autocorrect: false,
                          onChanged: (value) => context
                              .read<LogInBloc>()
                              .add(LogInEvent.nameChanged(value)),
                          validator: (_) =>
                              context.read<LogInBloc>().state.name.value.fold(
                                    (f) => f.maybeMap(
                                      invalidName: (_) => 'Invalid Name',
                                      empty: (_) => 'Name cannot be empty',
                                      orElse: () => null,
                                    ),
                                    (_) => null,
                                  ),
                        ),

                        const SizedBox(height: 25),
                        TextFormField(
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            labelText: 'Confirm Password',
                            contentPadding: const EdgeInsets.only(right: 8, left: 8),
                            suffix: GestureDetector(
                              onTap: () {
                                obscureText = !obscureText;
                                setState(() {});
                              },
                              child: obscureText
                                  ? const Icon(
                                Icons.visibility,
                                color: Colors.black,
                              )
                                  : const Icon(
                                Icons.visibility_off,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          obscureText: obscureText,
                          autocorrect: false,
                          onChanged: (value) => context
                              .read<LogInBloc>()
                              .add(LogInEvent.confirmPasswordChanged(value)),
                          validator: (_) =>
                          state.password.value != state.confirmPassword.value
                              ? 'Password Do Not Match'
                              : null,
                        ),
                        thickSpace,
                        thickSpace,
                        thickSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Are you a EduPro card holder?",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color:  Colors.orange,
                              ),
                            ),
                            ToggleSwitch(
                              minWidth: 50.0,
                              cornerRadius: 20.0,
                              activeBgColors: [
                                [secondaryColor],
                                [Colors.orange[800]!]
                              ],
                              // activeFgColor: Colors.white,
                              // inactiveBgColor: Colors.grey,
                              // inactiveFgColor: Colors.white,
                              initialLabelIndex:
                              state.userStatus == 'new_user' ? 1 : 0,
                              totalSwitches: 2,
                              labels: const ['YES', 'NO'],
                              radiusStyle: true,
                              onToggle: (index) {
                                String userStatus = 'new_user';

                                index == 0
                                    ? userStatus = 'edu_user'
                                    : userStatus = 'new_user';
                                context
                                    .read<LogInBloc>()
                                    .add(LogInEvent.userStatusChanged(userStatus));
                              },
                              //value: state.userStatus == 'new_user' ? false : true,
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * .06),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.info_outline,
                              color: Colors.black54,
                            ),
                            VerticalDivider(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                '''Edupro card holders can register account for free while non-card holders have 30 days trail before payment''',
                                style: TextStyle(color: Colors.black54),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                    thickSpaceLogin
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<LogInBloc>().add(const LogInEvent
                                .registerWithEmailAndPasswordPressed());
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Text('REGISTER',style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Pacifico',
                            fontSize: 20,
                            fontWeight: FontWeight.w200),),
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
      },
    );
  }
}
