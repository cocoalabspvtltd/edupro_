import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgs_edupro/application/Insistution_student_course_instructor/all_categories_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
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
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Text(
              "Personal Details",
              style: boldHeading,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                shadowColor: primaryColor[300],
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    thickSpace,
                    SizedBox(
                      width: screenWidth,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "About Me",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w500),
                            ),
                            thickSpace,
                            thickSpace,
                            Text(
                              "Hello I am  ${widget.studentdetails.name}",
                              style: TextStyle(fontSize: 18),
                            ),
                            thickSpace,
                            thickSpace,
                            Row(
                              children: [
                                Text(
                                  "Email :",
                                  style: details,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${widget.studentdetails.email}",
                                  style: details,
                                )
                              ],
                            ),
                            thickSpace1,
                            Row(
                              children: [
                                Text(
                                  "Date of birth :",
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 16),

                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  " ${widget.studentdetails.dob}",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 19),
                                )
                              ],
                            ),
                            thickSpace1,
                            Row(
                              children: [
                                Text(
                                  "Address :",
                                  style: details,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  " ${widget.studentdetails.address}",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 19),
                                )
                              ],
                            ),
                            thickSpace1,
                            Row(
                              children: [
                                Text(
                                  "Contact :",
                                  style: details,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${widget.studentdetails.phoneNumber}",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 19),
                                )
                              ],
                            ),

                            Row(
                              children: [
                                Text(
                                  "Department :",
                                  style: details,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${widget.studentdetails.department}",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 19),
                                )
                              ],
                            ),
                            thickSpace,
                            Row(
                              children: [
                                Text(
                                  "Course :",
                                  style: details,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${widget.studentdetails.course}",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 19),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
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
