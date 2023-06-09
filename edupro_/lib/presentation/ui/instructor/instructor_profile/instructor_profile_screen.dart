// import 'package:pgs_edupro/application/profile/instructor_profile_bloc.dart';
// import 'package:pgs_edupro/application/profile/profile_bloc.dart';
// import 'package:pgs_edupro/domain/core/constants.dart';
// import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
// import 'package:pgs_edupro/infrastructure/remote_data/repositories/profile/profile_repository.dart';
// import 'package:pgs_edupro/presentation/ui/profile/widgets/display_picture.dart';
// import 'package:pgs_edupro/presentation/ui/profile/widgets/profile_form.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
//
// class InstructorProfileScreen extends StatelessWidget {
//   InstructorProfileScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     print("apitoken->?${UserDetailsLocal.apiToken}");
//     return BlocProvider(
//       create: (context) => InstructorProfileBloc(InstructorsProfileRepository())..add(InstructorProfileEvent.loadMyProfile(int.parse(UserDetailsLocal.userId))),
//       child: Scaffold(
//           body: RefreshIndicator(
//             onRefresh: () async {
//               context.read<InstructorProfileBloc>().add(
//                   ProfileEvent.loadMyProfile(int.parse(UserDetailsLocal.userId)));
//             },
//             child: const SingleChildScrollView(
//                 physics: AlwaysScrollableScrollPhysics(), child: ProfileWidget()),
//           )),
//     );
//   }
// }
//
// class ProfileWidget extends StatelessWidget {
//   const ProfileWidget({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//             width: screenWidth,
//             //height: screenWidth / 2,
//             color: secondaryColor,
//             child: const Padding(
//               padding: EdgeInsets.all(15.0),
//               child: DisplayPicture(),
//             )),
//         const ProfileForm(),
//       ],
//     );
//   }
// }
