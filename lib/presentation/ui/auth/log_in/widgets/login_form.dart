import 'package:another_flushbar/flushbar_helper.dart';
import 'package:pgs_edupro/application/auth/auth_bloc.dart';
import 'package:pgs_edupro/application/auth/login_bloc/log_in_bloc.dart';
import 'package:pgs_edupro/application/payment/payment_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/presentation/ui/auth/edu_user_verification/edu_user_verification_screen.dart';
import 'package:pgs_edupro/presentation/ui/auth/register/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pgs_edupro/presentation/ui/instructor/instructor_home/instructor_home_screen.dart';
import 'package:pgs_edupro/presentation/ui/membership_check_screen.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  late LogInBloc logInBloc;
  final _formKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  void initState() {
    logInBloc = BlocProvider.of<LogInBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    logInBloc.close();
    super.dispose();
  }

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
                        userVerificationPending: (_) => 'User not verified yet',
                        userVerificationFailed: (_) => '',
                        verificationCodeinvalid: (_) => '',
                      ),
                    ).show(context);
                  },
                  (r) {
                    if (state.userStatus == 'edu_user') {
                      Get.offAll(() => EduUserVerificationScreen());
                      return;
                    }
                    if (state.userStatus == 'verified') {
                      Get.offAll(() => const MembershipCheckScreen());
                      return;
                    }
                    if(state.userStatus == "instructor"){
                      Get.to(InstructorHomeScreen());
                    }
                    if (state.password != state.confirmPassword) {
                  
                      if (r.user?.paymentStatus == 'true') {
                        Get.offAll(() => const MembershipCheckScreen());
                      } else if  (r.user!.paymentStatus == 'false') {
                        Get.offAll(() => const MembershipCheckScreen());
                        // String paymentType = 'REGISTRATION';
                        // context.read<PaymentBloc>().add(
                        //       PaymentEvent.startPayment(
                        //         '1500',
                        //         paymentType,
                        //       ),
                        //     );
                      }
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
              key: _formKey,
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
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                    ),
                    autocorrect: false,
                    onChanged: (value) => context
                        .read<LogInBloc>()
                        .add(LogInEvent.emailChanged(value)),
                    validator: (_) =>
                        context.read<LogInBloc>().state.emailAddress.value.fold(
                              (f) => f.maybeMap(
                                invalidEmail: (_) => 'Invalid email',
                                orElse: () => null,
                              ),
                              (_) => null,
                            ),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      labelText: 'Password',
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
                        .add(LogInEvent.passwordChanged(value)),
                    validator: (_) =>
                        context.read<LogInBloc>().state.password.value.fold(
                              (f) => f.maybeMap(
                                shortPassword: (_) => 'Short password',
                                orElse: () => null,
                              ),
                              (_) => null,
                            ),
                  ),
                  SizedBox(height: screenHeight * .1),
                  SizedBox(
                    height: 50,
                    width: screenWidth,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: ElevatedButton(
                        onPressed: () => context.read<LogInBloc>().add(
                            const LogInEvent
                                .signInWithEmailAndPasswordPressed()),
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Text('SIGN IN'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    height: 50,
                    width: screenWidth,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: ElevatedButton(
                        onPressed: () async {
                          context
                              .read<LogInBloc>()
                              .add(const LogInEvent.registerPressed());
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    BlocProvider<LogInBloc>.value(
                                  value: logInBloc,
                                  child: RegistrationTypeScreen(),
                                ),
                              ),
                            );
                            //Get.to(() => const RegisterScreen());
                          } else {
                            toastMessage(
                                'Enter Email Address and Password for Registration');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Text('REGISTER'),
                      ),
                    ),
                  ),

                ],
              ),
            );
          },
        );
      },
    );
  }
}
