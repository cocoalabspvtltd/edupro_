import 'dart:convert';

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
import 'package:pgs_edupro/presentation/ui/home/home_screen.dart';
import 'package:pgs_edupro/presentation/ui/institution/institution_home/institution_home_screen.dart';
import 'package:pgs_edupro/presentation/ui/instructor/instructor_home/instructor_home_screen.dart';
import 'package:pgs_edupro/presentation/ui/membership_check_screen.dart';

import '../../../../../domain/core/network/api_provider.dart';
import 'package:http/http.dart' as http;

import '../../../../../infrastructure/local_data_source/user.dart';
String? type="";
class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  late LogInBloc logInBloc;
  final _formKey = GlobalKey<FormState>();
  bool obscureText = true;
  var  OderId;
  ApiProvider? apiprovider;
  Future getOrderId() async {
    print("Get order");

    http.Response response = await http.get(Uri.parse('https://pgsedu.com/EduPro/index.php/api/count_list'),
      headers: <String, String>{
        'Accept': "appilication/json",
        'Authorization': 'Bearer ${UserDetailsLocal.apiToken}',

      },);
    print("Response${response.body}");
    var jsonData = json.decode(response.body);
    var  OrderIdResponse = jsonData;
    var  OderId = OrderIdResponse["count"];
    print("orderId->${OderId}");
    if(response.statusCode==200){

      // Get.to(() =>  PaymentFormScreen(orderid:OderId, courseDetails: courseList,));
    }
    return response;
  }
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
  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;
  double getBiglDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;
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
            print("-/>>>>>>>>${state.userStatus}");
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
                      type =state.userStatus!;
                      Get.offAll(() =>  const InstructorHomeScreen());
                      return;
                    }
                    if(state.userStatus == "institution"){
                      type =state.userStatus!;
                      Get.offAll(() =>  const InstitutionHomeScreen(
                      ));
                      return;
                    }
                    if(state.userStatus == "school"){
                      type =state.userStatus!;
                      Get.offAll(() =>  const InstitutionHomeScreen(

                      ));
                      return;
                    }
                    if (state.password != state.confirmPassword) {
                      if (r.user?.paymentStatus == 'true') {
                        Get.offAll(() => const MembershipCheckScreen());
                        return;
                      } else if  (r.user?.paymentStatus == 'false') {
                        Get.offAll(() => const HomeScreen());
                        return;
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
              child:Stack(
                children: <Widget>[
                  Positioned(
                    right: -getSmallDiameter(context) / 3,
                    top: -getSmallDiameter(context) / 3,
                    child: Container(
                      width: getSmallDiameter(context),
                      height: getSmallDiameter(context),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient:LinearGradient(
                              colors: [
                                Color(0xFFB226B2),
                                Colors.orange
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                    ),
                  ),
                  Positioned(
                    left: -getBiglDiameter(context) / 4,
                    top: -getBiglDiameter(context) / 4,
                    child: Container(
                      width: getBiglDiameter(context),
                      height: getBiglDiameter(context),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient:  const LinearGradient(
            colors: [
            Color(0xFFB226B2),
            Colors.orange
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter)),
                      child:
                      Row(
                        children: [
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: 90.0,top: 50),
                              child:  Image.asset(
                                'assets/splash/PGEduLOGO.png',
                                height: 100,
                                fit: BoxFit.fitHeight,
                              ),
                            ),

                          ),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text(
                  "Pg's\nEducating Values",
                  style: TextStyle(
                      fontFamily: "Pacifico",
                      fontSize: 20,
                      color: Colors.white ),
                ),
              ),
            ),
                        ],
                      ),
                      //
                      // const Center(
                      //   child: Padding(
                      //     padding: EdgeInsets.only(left: 40.0,top: 50),
                      //     child: Text(
                      //       "Learning App",
                      //       style: TextStyle(
                      //           fontFamily: "Pacifico",
                      //           fontSize: 35,
                      //           color: Colors.white ),
                      //     ),
                      //   ),
                      // ),
                    ),
                  ),
                  thickSpaceLogin,
                  SizedBox(height: screenHeight,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ListView(
                        children: <Widget>[
                          thickSpaceLogin,
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                //border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            margin: const EdgeInsets.fromLTRB(20, 300, 20, 10),
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
                            child: Column(
                              children:  <Widget>[
                                    TextFormField(
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration:  InputDecoration(
                                        icon: const Icon(
                                          Icons.email,
                                          color:  Colors.deepOrange,
                                        ),    focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.grey.shade100 )),
                                          labelText: "Email",
                                          enabledBorder: InputBorder.none,
                                          labelStyle: const TextStyle(color: Colors.grey)),
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
                                    TextFormField(
                                      keyboardType: TextInputType.visiblePassword,
                                      textInputAction: TextInputAction.done,
                                      decoration: InputDecoration(
            icon: const Icon(
            Icons.vpn_key,
            color: Colors.deepOrange,
            ),
            focusedBorder: UnderlineInputBorder(
            borderSide:
            BorderSide(color: Colors.grey.shade100)),
            labelText: "Password",
            enabledBorder: InputBorder.none,
            labelStyle: const TextStyle(color: Colors.grey),
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

                              ],
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.fromLTRB(20, 20, 20, 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  height: 40,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: const LinearGradient(
                                            colors: [

                                              Colors.orangeAccent,
                                              Colors.orange,

                                              Color(0xFFB226B2),
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter)),
                                    child: Material(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(20),
                                        splashColor: Colors.amber,
                                        onTap: () {},
                                        child:  Center(
                                          child: GestureDetector(
                                            onTap: (){
                                              context.read<LogInBloc>().add(
                                                                const LogInEvent
                                                                    .signInWithEmailAndPasswordPressed());

                                            },
                                            child: const Text(
                                              "SIGN   IN",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Pacifico',
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  height: 40,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: const LinearGradient(
                                            colors: [
                                              Colors.orangeAccent,
                                              Colors.orange,

                                              Color(0xFFB226B2),
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter)),
                                    child: Material(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(20),
                                        splashColor: Colors.amber,
                                        onTap: () {},
                                        child:  Center(
                                          child: GestureDetector(
                                            onTap: ()async {
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
                                            child: Text(
                                              "SIGN  UP",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Pacifico',
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Text(
                                "FORGOT YOUR PASSWORD ? ",
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey,
                                    fontFamily: 'Pacifico',
                                    fontWeight: FontWeight.w200),
                              ),
                              Text(
                                " CLICK HERE",
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.deepOrange,
                                    fontFamily: 'Pacifico',
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),

                          const SizedBox(
                            height: 100,

                          ),

                          const Center(
                          child: Padding(
            padding: EdgeInsets.only(top: 100),
            child: Text(
            "Learning App",
            style: TextStyle(
            fontFamily: "Pacifico",
            fontSize: 15,
            color: Colors.deepOrange,),
            ),
            ),
            ),
                        ],


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
