import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgs_edupro/application/Insistution_student_course_instructor/all_categories_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/insistution/insistutionResponse.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/course/course_repository.dart';
import 'package:pgs_edupro/presentation/widgets/common_result_empty_widget.dart';
import 'package:pgs_edupro/presentation/widgets/common_server_error_widget.dart';

class ViewStudentDetailsCreen extends StatefulWidget {
  final StudentList studentdetails;

  const ViewStudentDetailsCreen({super.key, required this.studentdetails});

  @override
  State<ViewStudentDetailsCreen> createState() =>
      _ViewStudentDetailsCreenState();
}

class _ViewStudentDetailsCreenState extends State<ViewStudentDetailsCreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTheme("Student details"),
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  thickSpace,
                  Row(
                    children: [
                      Container(
                          width: screenWidth * .3,
                          height: screenWidth * 0.7,
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl: UserDetailsLocal.storageBaseUrl +
                                  '${widget.studentdetails.profilePhoto}',
                              placeholder: (context, url) => Container(
                                margin: const EdgeInsets.all(1),
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                    margin: const EdgeInsets.all(0),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover)),
                                  ),
                              errorWidget: (context, url, error) =>
                                  Container(
                                    width: screenWidth * .14,
                                    height: screenWidth * .14,
                                    padding: const EdgeInsets.all(5),
                                    child: const Image(
                                      image: AssetImage(
                                          'assets/icons/drawer_icons/display-picture-sltd.png'),
                                      height: double.infinity,
                                      width: double.infinity,
                                    ),
                                  ),
                            ),
                          )),
                      SizedBox(width:10,),
                      Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${widget.studentdetails.name!.toUpperCase()}"),
                              thickSpace,
                              Text("${widget.studentdetails.department}"),
                              thickSpace,
                              Row(
                                children: [
                                  Icon(Icons.calendar_today,color: primaryColor,),
                                  SizedBox(width: 10,),
                                  Text("${widget.studentdetails.dob}"),
                                ],
                              ),
                              thickSpace,
                              Row(
                                children: [
                                  Icon(Icons.location_on_outlined,color: primaryColor,),
                                  SizedBox(width: 10,),
                                  Text("${widget.studentdetails.address}"),
                                ],
                              ),
                              thickSpace,
                              Row(
                                children: [
                                  Icon(Icons.email_outlined,color: primaryColor,),
                                  SizedBox(width: 10,),
                                  Text("${widget.studentdetails.email}"),
                                ],
                              ),
                              thickSpace,
                              Row(
                                children: [
                                  Icon(Icons.call,color: primaryColor,),
                                  SizedBox(width: 10,),
                                  Text("${widget.studentdetails.phoneNumber}"),
                                ],
                              ),
                              thickSpace,
                              Row(
                                children: [
                                  Icon(Icons.business_outlined,color: primaryColor,),
                                  SizedBox(width: 10,),
                                  Text("${widget.studentdetails.institution}"),
                                ],
                              ),
                              thickSpace,
                              Row(
                                children: [
                                  Icon(Icons.collections_bookmark_sharp,color: primaryColor,),
                                  SizedBox(width: 10,),
                                  Text("${widget.studentdetails.course}"),
                                ],
                              ),
                            ]
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  thickSpace,
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              thickSpace,
              thickSpace,
            ],
          ),
        ),
      ),
    );
  }
}
