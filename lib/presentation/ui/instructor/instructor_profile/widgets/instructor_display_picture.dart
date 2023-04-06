// import 'dart:io';
// import 'package:another_flushbar/flushbar_helper.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:pgs_edupro/application/profile/instructor_profile_bloc.dart';
// import 'package:pgs_edupro/application/profile/profile_bloc.dart';
// import 'package:pgs_edupro/domain/core/constants.dart';
// import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
//
// class InstructorDisplayPicture extends StatefulWidget {
//
//   InstructorDisplayPicture({super.key});
//
//   @override
//   State<InstructorDisplayPicture> createState() => _InstructorDisplayPictureState();
// }
//
// class _InstructorDisplayPictureState extends State<InstructorDisplayPicture> {
//   XFile? _image;
//   final ImagePicker _picker = ImagePicker();
//   @override
//   Widget build(BuildContext context) {
//     print("Userid:${UserDetailsLocal.userId}");
//     print("apitoken->?${UserDetailsLocal.apiToken}");
//     return BlocConsumer<InstructorProfileBloc, InstructorProfileEvent  >(
//       listener: (context, state) {
//         state.submitFailedOrSuccessOption.fold(() {}, (either) {
//           either.fold((failure) {
//             FlushbarHelper.createError(
//               message: failure.map(
//                 unexpected: (value) => 'Unexpected Error',
//                 serverError: (value) => 'Server Error Code: $value',
//                 serverTimeOut: (value) => 'Server Timed Out',
//                 unAuthorized: (value) => value.message,
//                 nullData: (value) => 'Data Not Found',
//               ),
//             ).show(context);
//           }, (r) => null);
//         });
//       },
//       builder: (context, state) {
//         return  state.isLoading
//             ? Container()
//             : _image != null
//             ? Stack(
//           children: [
//             Container(
//                 width: screenWidth * .35,
//                 height: screenWidth * .45,
//                 padding: const EdgeInsets.all(1),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: primaryColor),
//                   color: primaryColor[100],
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: ClipRRect(
//                     borderRadius: BorderRadius.circular(8),
//                     child: Image.file(
//                       File(_image!.path),
//                       fit: BoxFit.cover,
//                     ))),
//             Positioned(
//               right: 0,
//               bottom: 0,
//               left: 0,
//               top: 0,
//               child: GestureDetector(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.upload,
//                         color: primaryColor,
//                       ),
//                       Text(
//                         'Tap to upload',
//                         style: TextStyle(
//                             color: primaryColor,
//                             fontWeight: FontWeight.w500),
//                       ),
//                     ],
//                   ),
//                   onTap: () async {
//                     final File imageC = File(_image!.path);
//                     context.read<ProfileBloc>().add(
//                         ProfileEvent.updateDisplayPicture(imageC));
//                     _image = null;
//                     setState(() {});
//                   }),
//             ),
//             Positioned(
//               bottom: 40,
//               right: 0,
//               child: Text(
//                 state.name.value.getOrElse(
//                       () => '',
//                 ),
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.w500),
//               ),
//             ),
//             Positioned(
//               bottom: 20,
//               right: 0,
//               child: Text(
//                 state.emailAddress.value.getOrElse(
//                       () => '',
//                 ),
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400),
//               ),
//             ),
//             Positioned(
//                 right: 0,
//                 top: 50,
//                 child: IconButton(
//                     alignment: Alignment.topRight,
//                     padding: EdgeInsets.zero,
//                     onPressed: () => context
//                         .read<ProfileBloc>()
//                         .add(const ProfileEvent.enableEdit()),
//                     icon: Icon(
//                       state.enableEdit ? Icons.edit_off : Icons.edit,
//                       color: state.enableEdit
//                           ? primaryColor
//                           : secondaryColor[100],
//                       size: 30,
//                     ))),
//             Positioned(
//               right: 0,
//               top: 10,
//               child: IconButton(
//                   alignment: Alignment.topRight,
//                   padding: EdgeInsets.zero,
//                   icon: Icon(
//                     Icons.camera_alt,
//                     color: secondaryColor[100],
//                     size: 30,
//                   ),
//                   onPressed: () async {
//                     await _showpicker(context);
//                   }),
//             )
//           ],
//         )
//             : Stack(
//           children: [
//             Container(
//                 width: screenWidth * .35,
//                 height: screenWidth * .45,
//                 padding: const EdgeInsets.all(1),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: primaryColor),
//                   color: primaryColor[100],
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(8),
//                   child: CachedNetworkImage(
//                     fit: BoxFit.cover,
//                     imageUrl: UserDetailsLocal.storageBaseUrl +
//                         state.displayImageUrl,
//                     placeholder: (context, url) => Container(
//                       margin: const EdgeInsets.all(1),
//                       child: const Center(
//                         child: CircularProgressIndicator(),
//                       ),
//                     ),
//                     imageBuilder: (context, imageProvider) =>
//                         Container(
//                           margin: const EdgeInsets.all(1),
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                                 image: imageProvider, fit: BoxFit.cover),
//                           ),
//                         ),
//                     errorWidget: (context, url, error) => Container(
//                       width: screenWidth * .14,
//                       height: screenWidth * .14,
//                       padding: const EdgeInsets.all(5),
//                       child: const Image(
//                         image: AssetImage(
//                             'assets/icons/drawer_icons/display-picture-sltd.png'),
//                         height: double.infinity,
//                         width: double.infinity,
//                       ),
//                     ),
//                   ),
//                 )),
//             Positioned(
//               bottom: 40,
//               right: 0,
//               child: Text(
//                 state.name.value.getOrElse(
//                       () => '',
//                 ),
//                 style: TextStyle(
//                     color: secondaryColor[50],
//                     fontSize: 18,
//                     fontWeight: FontWeight.w500),
//               ),
//             ),
//             Positioned(
//               bottom: 20,
//               right: 0,
//               child: Text(
//                 state.emailAddress.value.getOrElse(
//                       () => '',
//                 ),
//                 style: TextStyle(
//                     color: secondaryColor[50],
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400),
//               ),
//             ),
//             Positioned(
//                 right: 0,
//                 top: 50,
//                 child: IconButton(
//                     alignment: Alignment.topRight,
//                     padding: EdgeInsets.zero,
//                     onPressed: () => context
//                         .read<ProfileBloc>()
//                         .add(const ProfileEvent.enableEdit()),
//                     icon: Icon(
//                       state.enableEdit ? Icons.edit_off : Icons.edit,
//                       color: state.enableEdit
//                           ? primaryColor
//                           : secondaryColor[100],
//                       size: 30,
//                     ))),
//             Positioned(
//               right: 0,
//               top: 10,
//               child: IconButton(
//                   alignment: Alignment.topRight,
//                   padding: EdgeInsets.zero,
//                   icon: Icon(
//                     Icons.camera_alt,
//                     color: secondaryColor[100],
//                     size: 30,
//                   ),
//                   onPressed: () async {
//                     await _showpicker(context);
//                   }),
//             )
//           ],
//         );
//
//       },
//     );
//   }
//
//   _imagefromGallery(context) async {
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       _image = image;
//     });
//     Get.back();
//   }
//
//   _imagefromComera(context) async {
//     final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
//     setState(() {
//       _image = photo;
//     });
//     Get.back();
//   }
//
//   _showpicker(context) {
//     showModalBottomSheet(
//         shape:
//         RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//         backgroundColor: Colors.white,
//         context: context,
//         builder: (context) {
//           return SizedBox(
//             height: 100,
//             child: Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Column(
//                     children: [
//                       SizedBox(width: screenWidth * 0.1),
//                       CircleAvatar(
//                         radius: 24,
//                         backgroundColor: primaryColor,
//                         child: IconButton(
//                           onPressed: () {
//                             _imagefromComera(context);
//                           },
//                           icon: const Icon(Icons.camera_alt_rounded,
//                               color: Colors.white),
//                           iconSize: 30,
//                         ),
//                       ),
//                       const Text("Camera"),
//                     ],
//                   ),
//                   SizedBox(width: screenWidth * 0.08),
//                   Column(
//                     children: [
//                       CircleAvatar(
//                         radius: 24,
//                         backgroundColor: primaryColor,
//                         child: IconButton(
//                           onPressed: () {
//                             _imagefromGallery(context);
//                           },
//                           icon: const Icon(Icons.photo),
//                           color: Colors.white,
//                           iconSize: 30,
//                         ),
//                       ),
//                       const Text("Gallery"),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }
