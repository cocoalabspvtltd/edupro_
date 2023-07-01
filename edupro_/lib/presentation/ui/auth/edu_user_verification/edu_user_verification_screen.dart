import 'package:pgs_edupro/application/auth/login_bloc/log_in_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/auth/server_auth_facade.dart';
import 'package:pgs_edupro/presentation/ui/auth/edu_user_verification/widgets/verification_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EduUserVerificationScreen extends StatelessWidget {
  EduUserVerificationScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: BlocProvider(
        create: (context) => LogInBloc(authFacade: ServerAuthFacade()),
        child: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  'assets/splash/splash.png',
                  height: 200,
                  fit: BoxFit.fitHeight,
                ),
                VerificationForm(
                  formKey: formKey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
