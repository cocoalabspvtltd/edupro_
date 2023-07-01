// ignore_for_file: prefer_const_constructors
import 'package:pgs_edupro/application/profile/profile_bloc.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/profile/profile_repository.dart';
import 'package:pgs_edupro/presentation/ui/profile/widgets/password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(ProfileRepository()),
      child: Scaffold(
        appBar: AppBar(title: Text("Change Password")),
        body: ChangePasswordForm(formKey: formKey),
      ),
    );
  }
}
