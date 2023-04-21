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
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Student details',
          style: boldValuePrimaryColor,
        ),
      ),
      body:SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Text("Personal Details",style: boldHeading,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                shadowColor: primaryColor[300],
                elevation: 4,
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    thickSpace,
                    SizedBox(
                      width: screenWidth,
                      child: Padding(
                        padding:
                        const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                width: 140,
                                height: 140,
                                padding: EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.circular(60),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.fill,
                                    imageUrl:UserDetailsLocal.storageBaseUrl+'${widget.studentdetails.profilePhoto}',
                                    placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                    errorWidget: (context, url, error) => CircleAvatar(
                                      radius: 46.0,
                                      backgroundImage:
                                      AssetImage('assets/icons/profile_icons/person.png'),
                                      backgroundColor: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            thickSpace,
                            Row(children: [
                              Icon(Icons.email_outlined,color: primaryColor,),
                              SizedBox(width: 10,),
                              Text("${widget.studentdetails.email}",style: details,)
                            ],),
                            thickSpace,
                            Row(children: [
                              Icon(Icons.call,color: primaryColor,),
                              SizedBox(width: 10,),
                              Text("${widget.studentdetails.phoneNumber}",style: details,)
                            ],),
                            thickSpace,
                            Row(children: [
                              Icon(Icons.date_range,color: primaryColor,),
                              SizedBox(width: 10,),
                              Text("${widget.studentdetails.dob}",style: details,)
                            ],),
                            thickSpace,
                            Row(children: [
                              Icon(Icons.location_on_outlined,color: primaryColor,),
                              SizedBox(width: 10,),
                              Text("${widget.studentdetails.address}",style: details,)
                            ],),
                            thickSpace,
                            Row(children: [
                              Icon(Icons.collections_bookmark_sharp,color: primaryColor,),
                              SizedBox(width: 10,),
                              Text("${widget.studentdetails.course}",style: details,)
                            ],),
                            thickSpace,
                            Row(children: [
                              Icon(Icons.business_outlined,color: primaryColor,),
                              SizedBox(width: 10,),
                              Text("${widget.studentdetails.institution}",style: details,)
                            ],),
                            thickSpace,
                          ],
                        ),
                      ),
                    ),
                    thickSpace,
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Card(
              shadowColor: primaryColor[300],
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About Me",
                      style: TextStyle(
                          fontSize: 19,fontWeight: FontWeight.w500),
                    ),
                    thickSpace,
                    thickSpace,
                    Text(
                      "Hello I am ${widget.studentdetails.name} ",
                      style: TextStyle(
                          fontSize: 18,fontWeight: FontWeight.bold),
                    ),
                    thickSpace,
                    Text('Nice to have back,What an exciting day ! \nGet ready and Continue your lessons today',),
                    thickSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
