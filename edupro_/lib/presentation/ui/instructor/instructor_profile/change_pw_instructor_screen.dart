import 'package:pgs_edupro/application/profile/profile_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/profile/profile_repository.dart';
import 'package:pgs_edupro/presentation/ui/instructor/instructor_profile/widgets/instructor_password_form.dart';
import 'package:pgs_edupro/presentation/ui/profile/widgets/password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InstructorChangePasswordScreen extends StatelessWidget {
  InstructorChangePasswordScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(ProfileRepository()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
            title: Text("Change Password",style: TextStyle(color: primaryColor),)),
        body: InstructorChangePasswordForm(formKey: formKey),
      ),
    );
  }
}
