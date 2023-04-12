import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/presentation/ui/institution/students_of_institution/widgets/add_students_form.dart';


class AddCoursesScreen extends StatefulWidget {
  final GlobalKey<FormState>? formKey;
  const AddCoursesScreen({Key? key, this.formKey,}) : super(key: key);

  @override
  State<AddCoursesScreen> createState() => _AddCoursesScreenState();
}

class _AddCoursesScreenState extends State<AddCoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Add Courses",
            style: boldValuePrimaryColor,
          ),
        ),
        body: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      "Course Details",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                AddStudentsForm()
              ],
            ),
          ),
        ));
  }

}
