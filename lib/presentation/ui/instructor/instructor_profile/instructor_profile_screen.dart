import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/presentation/ui/instructor/instructor_profile/widgets/instructor_display_picture.dart';
import 'package:pgs_edupro/presentation/ui/instructor/instructor_profile/widgets/instructor_profile_form.dart';
import 'package:flutter/material.dart';

class InstructorProfileScreen extends StatelessWidget {
  const InstructorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            // context.read<ProfileBloc>().add(
            //     ProfileEvent.loadMyProfile(int.parse(UserDetailsLocal.userId)));
          },
          child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Container(
                      width: screenWidth,
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: InstructorDisplayPicture(),
                      )),
                  const InstructorProfileForm(),
                ],
              )),
        ));
  }
}
