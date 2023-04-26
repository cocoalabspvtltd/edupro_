import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgs_edupro/application/auth/login_bloc/log_in_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/presentation/ui/auth/log_in/login_screen.dart';
import 'package:pgs_edupro/presentation/ui/instructor/instructor_home/instructor_home_screen.dart';

class RegisterationInstructorScreen extends StatefulWidget {
  final GlobalKey<FormState>? formKey;
  const RegisterationInstructorScreen(
      {Key? key, this.formKey, required this.userStatus})
      : super(key: key);
  final String userStatus;
  @override
  State<RegisterationInstructorScreen> createState() =>
      _RegisterationInstructorScreenState();
}

class _RegisterationInstructorScreenState
    extends State<RegisterationInstructorScreen> {
  final formKey = GlobalKey<FormState>();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTheme("Instructor Register"),
      body: BlocConsumer<LogInBloc, LogInState>(
        listener: (context, state) {
          state.authFailureOrSuccessOption.fold(
            () {},
            (either) {
              either.fold(
                (failure) {
                  FlushbarHelper.createError(
                    message: failure.map(
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
                  if (widget.userStatus == 'individual_instructor') {
                    Fluttertoast.showToast(msg: "${state.userStatus}");
                    Get.offAll(() => LogInScreen());
                  }
                },
              );
            },
          );
        },
        builder: (context, state) {
          return SizedBox(
            height: screenHeight,
            width: screenWidth,

            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    'assets/icons/register_icons/instructor.png',
                    height: 150,
                    color:  Colors.orangeAccent,
                  ),
                  Form(
                    autovalidateMode: state.showErrorMessages
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    key: formKey,
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(15.0),
                      children: <Widget>[
                        SizedBox(height: screenHeight * .05),
                        Container(    decoration: BoxDecoration(
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
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  labelText: 'Qualification',
                                ),
                                autocorrect: false,
                                onChanged: (value) => context
                                    .read<LogInBloc>()
                                    .add(LogInEvent.qualificationChanged(value)),
                                validator: (_) => context
                                    .read<LogInBloc>()
                                    .state
                                    .qualification
                                    .value
                                    .fold(
                                      (f) => f.maybeMap(
                                    invalidName: (_) => 'Invalid Qualification',
                                    empty: (_) => 'Qualification cannot be empty',
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
                                  contentPadding:
                                  const EdgeInsets.only(right: 8, left: 8),
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
                                validator: (_) => state.password.value !=
                                    state.confirmPassword.value
                                    ? 'Password Do Not Match'
                                    : null,
                              ),
                            ],
                          ),
                        ),
                        thickSpace,
                        thickSpace,
                        Padding(
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                print("->${state.userStatus}");
                                if (formKey.currentState!.validate()) {
                                  context.read<LogInBloc>().add(LogInEvent
                                      .registerWithInstructorEmailAndPasswordPressed(
                                          widget.userStatus));

                                  //Get.offAll(() => InstructorHomeScreen());
                                }
                                // if (state.userStatus == 'Registered Successfully') {
                                //   Get.offAll(() => InstructorHomeScreen());
                                // }
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
