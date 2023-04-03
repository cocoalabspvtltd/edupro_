import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgs_edupro/application/profile/profile_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/presentation/ui/instructor/instructor_profile/widgets/instructor_display_picture.dart';
import 'package:pgs_edupro/presentation/ui/instructor/instructor_profile/widgets/instructor_profile_form.dart';
import 'package:flutter/material.dart';
import 'package:pgs_edupro/presentation/ui/profile/widgets/display_picture.dart';

class InstructorProfileScreen extends StatelessWidget {
  const InstructorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("${UserDetailsLocal.userId}");
    return Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            context.read<ProfileBloc>().add(
                ProfileEvent.loadMyProfile(int.parse(UserDetailsLocal.userId)));
          },
          child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Container(
                      width: screenWidth,
                      color: Colors.black,
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: DisplayPicture(),
                      )),
                  const InstructorProfileForm(),
                ],
              )),
        ));
  }
}
