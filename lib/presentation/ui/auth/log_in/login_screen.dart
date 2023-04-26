import 'package:pgs_edupro/application/auth/login_bloc/log_in_bloc.dart';
import 'package:pgs_edupro/application/payment/payment_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/auth/server_auth_facade.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/payment/payment_repository.dart';
import 'package:pgs_edupro/presentation/ui/auth/log_in/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Sign In'),
      // ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => LogInBloc(authFacade: ServerAuthFacade())),
          BlocProvider(create: (_) => PaymentBloc(PaymentRepository()))
          //..add(PaymentEvent())),
        ],
        child:LogInForm()

        // SizedBox(
        //   height: screenHeight,
        //   width: screenWidth,
        //   child: SingleChildScrollView(
        //     child: Column(
        //       children: [
        //         const SizedBox(
        //           height: 50,
        //         ),
        //         Image.asset(
        //           'assets/splash/pg logo.png',
        //           height: 100,
        //           fit: BoxFit.fitHeight,
        //         ),
        //         const LogInForm(),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
