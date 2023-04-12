import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pgs_edupro/application/insistution_student/insistution_student_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';

import '../../../../../infrastructure/remote_data/repositories/course/course_repository.dart';
import 'add_students_form.dart';


class StudentAddCourse extends StatelessWidget {
  const StudentAddCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Add Students",
            style: boldValuePrimaryColor,
          ),
        ),
        body:
        BlocProvider(create: (_)=>InsistutionStudentBloc(CourseRepository()),
          child: SingleChildScrollView(
              child: AddStudentsForm()),)
    );

  }
}