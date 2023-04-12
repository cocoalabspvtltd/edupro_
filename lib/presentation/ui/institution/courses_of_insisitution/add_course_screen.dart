import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/presentation/ui/institution/courses_of_insisitution/widgets/add_course_form.dart';
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
        body: SingleChildScrollView(
          child: AddCoursesForm()
        ));
  }

}
