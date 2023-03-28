import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgs_edupro/application/auth/login_bloc/log_in_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/presentation/ui/institution/institution_home/institution_home_screen.dart';

class RegisterationInstitutionScreen extends StatefulWidget {
  final GlobalKey<FormState>? formKey;
  const RegisterationInstitutionScreen(
      {Key? key, this.formKey, required this.userStatus})
      : super(key: key);
  final String userStatus;
  @override
  State<RegisterationInstitutionScreen> createState() =>
      _RegisterationInstitutionScreenState();
}

class _RegisterationInstitutionScreenState
    extends State<RegisterationInstitutionScreen> {
  final formKey = GlobalKey<FormState>();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Image.asset(
              'assets/splash/logo_splash.png',
              height: 200,
              fit: BoxFit.fitHeight,
            ),
            Form(
              // autovalidateMode: state.showErrorMessages
              //     ? AutovalidateMode.always
              //     : AutovalidateMode.disabled,
              key: formKey,
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(15.0),
                children: <Widget>[
                  SizedBox(height: screenHeight * .02),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: 'Institution Name',
                    ),
                    autocorrect: false,
                    onChanged: (value) => context
                        .read<LogInBloc>()
                        .add(LogInEvent.nameChanged(value)),
                    validator: (_) => context
                        .read<LogInBloc>()
                        .state
                        .name
                        .value
                        .fold(
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
                      labelText: 'Address',
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
                        invalidName: (_) =>
                        'Invalid Qualification',
                        empty: (_) =>
                        'Qualification cannot be empty',
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
                      labelText: 'Institution Code',
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
                        invalidName: (_) =>
                        'Invalid Qualification',
                        empty: (_) =>
                        'Qualification cannot be empty',
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
                        .add(
                        LogInEvent.confirmPasswordChanged(value)),
                    // validator: (_) => state.password.value !=
                    //     state.confirmPassword.value
                    //     ? 'Password Do Not Match'
                    //     : null,
                  ),
                  thickSpace,
                  thickSpace,
                  thickSpace,
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 10, right: 10),
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // if (formKey.currentState!.validate()) {
                          //   context.read<LogInBloc>().add( LogInEvent.registerWithInstructorEmailAndPasswordPressed(widget.userStatus));
                          //
                          //   //Get.offAll(() => InstructorHomeScreen());
                          // }
                          Get.offAll(() => InstitutionHomeScreen());
                        },
                        style: ElevatedButton.styleFrom(
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
            ),
          ],
        ),
      ),
       // BlocConsumer<LogInBloc, LogInState>(
      //   listener: (context, state) {
      //     state.authFailureOrSuccessOption.fold(
      //           () {},
      //           (either) {
      //         either.fold(
      //               (failure) {
      //             FlushbarHelper.createError(
      //               message: failure.map(
      //                 cancelledByUser: (_) => 'Cancelled',
      //                 serverError: (_) => 'Server error',
      //                 emailAlreadyInUse: (_) => 'Email already in use',
      //                 invalidEmailAndPasswordCombination: (_) =>
      //                 'Invalid email and password combination',
      //                 userVerificationPending: (_) => 'User not verified',
      //                 userVerificationFailed: (_) => '',
      //                 verificationCodeinvalid: (_) => '',
      //               ),
      //             ).show(context);
      //           },
      //               (_) async {
      //             if (widget.userStatus == 'individual_instructor') {
      //               Get.offAll(() => InstructorHomeScreen());
      //             }
      //           },
      //         );
      //       },
      //     );
      //   },
      //   builder: (context, state) {
      //     return SizedBox(
      //       height: screenHeight,
      //       width: screenWidth,
      //       child: SingleChildScrollView(
      //         child: Column(
      //           children: [
      //             const SizedBox(
      //               height: 50,
      //             ),
      //             Image.asset(
      //               'assets/splash/splash.png',
      //               height: 200,
      //               fit: BoxFit.fitHeight,
      //             ),
      //             Form(
      //               // autovalidateMode: state.showErrorMessages
      //               //     ? AutovalidateMode.always
      //               //     : AutovalidateMode.disabled,
      //               key: formKey,
      //               child: ListView(
      //                 shrinkWrap: true,
      //                 physics: const NeverScrollableScrollPhysics(),
      //                 padding: const EdgeInsets.all(15.0),
      //                 children: <Widget>[
      //                   SizedBox(height: screenHeight * .02),
      //                   TextFormField(
      //                     textInputAction: TextInputAction.next,
      //                     keyboardType: TextInputType.name,
      //                     decoration: const InputDecoration(
      //                       prefixIcon: Icon(Icons.person),
      //                       labelText: 'Institution Name',
      //                     ),
      //                     autocorrect: false,
      //                     onChanged: (value) => context
      //                         .read<LogInBloc>()
      //                         .add(LogInEvent.nameChanged(value)),
      //                     validator: (_) => context
      //                         .read<LogInBloc>()
      //                         .state
      //                         .name
      //                         .value
      //                         .fold(
      //                           (f) => f.maybeMap(
      //                         invalidName: (_) => 'Invalid Name',
      //                         empty: (_) => 'Name cannot be empty',
      //                         orElse: () => null,
      //                       ),
      //                           (_) => null,
      //                     ),
      //                   ),
      //                   const SizedBox(height: 25),
      //                   TextFormField(
      //                     textInputAction: TextInputAction.next,
      //                     keyboardType: TextInputType.name,
      //                     decoration: const InputDecoration(
      //                       prefixIcon: Icon(Icons.person),
      //                       labelText: 'Address',
      //                     ),
      //                     autocorrect: false,
      //                     onChanged: (value) => context
      //                         .read<LogInBloc>()
      //                         .add(LogInEvent.qualificationChanged(value)),
      //                     validator: (_) => context
      //                         .read<LogInBloc>()
      //                         .state
      //                         .qualification
      //                         .value
      //                         .fold(
      //                           (f) => f.maybeMap(
      //                         invalidName: (_) =>
      //                         'Invalid Qualification',
      //                         empty: (_) =>
      //                         'Qualification cannot be empty',
      //                         orElse: () => null,
      //                       ),
      //                           (_) => null,
      //                     ),
      //                   ),
      //                   const SizedBox(height: 25),
      //                   TextFormField(
      //                     textInputAction: TextInputAction.next,
      //                     keyboardType: TextInputType.name,
      //                     decoration: const InputDecoration(
      //                       prefixIcon: Icon(Icons.person),
      //                       labelText: 'Institution Code',
      //                     ),
      //                     autocorrect: false,
      //                     onChanged: (value) => context
      //                         .read<LogInBloc>()
      //                         .add(LogInEvent.qualificationChanged(value)),
      //                     validator: (_) => context
      //                         .read<LogInBloc>()
      //                         .state
      //                         .qualification
      //                         .value
      //                         .fold(
      //                           (f) => f.maybeMap(
      //                         invalidName: (_) =>
      //                         'Invalid Qualification',
      //                         empty: (_) =>
      //                         'Qualification cannot be empty',
      //                         orElse: () => null,
      //                       ),
      //                           (_) => null,
      //                     ),
      //                   ),
      //                   const SizedBox(height: 25),
      //                   TextFormField(
      //                     textInputAction: TextInputAction.done,
      //                     keyboardType: TextInputType.visiblePassword,
      //                     decoration: InputDecoration(
      //                       prefixIcon: const Icon(Icons.lock),
      //                       labelText: 'Confirm Password',
      //                       contentPadding:
      //                       const EdgeInsets.only(right: 8, left: 8),
      //                       suffix: GestureDetector(
      //                         onTap: () {
      //                           obscureText = !obscureText;
      //                           setState(() {});
      //                         },
      //                         child: obscureText
      //                             ? const Icon(
      //                           Icons.visibility,
      //                           color: Colors.black,
      //                         )
      //                             : const Icon(
      //                           Icons.visibility_off,
      //                           color: Colors.black,
      //                         ),
      //                       ),
      //                     ),
      //                     obscureText: obscureText,
      //                     autocorrect: false,
      //                     onChanged: (value) => context
      //                         .read<LogInBloc>()
      //                         .add(
      //                         LogInEvent.confirmPasswordChanged(value)),
      //                     // validator: (_) => state.password.value !=
      //                     //     state.confirmPassword.value
      //                     //     ? 'Password Do Not Match'
      //                     //     : null,
      //                   ),
      //                   thickSpace,
      //                   thickSpace,
      //                   thickSpace,
      //                   Padding(
      //                     padding:
      //                     const EdgeInsets.only(left: 10, right: 10),
      //                     child: SizedBox(
      //                       height: 50,
      //                       child: ElevatedButton(
      //                         onPressed: () {
      //                           // if (formKey.currentState!.validate()) {
      //                           //   context.read<LogInBloc>().add( LogInEvent.registerWithInstructorEmailAndPasswordPressed(widget.userStatus));
      //                           //
      //                           //   //Get.offAll(() => InstructorHomeScreen());
      //                           // }
      //                           // Get.offAll(() => InstructorHomeScreen());
      //                         },
      //                         style: ElevatedButton.styleFrom(
      //                           shape: RoundedRectangleBorder(
      //                             borderRadius: BorderRadius.circular(5),
      //                           ),
      //                         ),
      //                         child: const Text('REGISTER'),
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}