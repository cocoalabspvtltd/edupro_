import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/presentation/ui/instructor/instructor_add_course/add_course_form.dart';

import '../../../../application/instructor/instructor_bloc.dart';
import '../../../../infrastructure/remote_data/repositories/course/course_repository.dart';


class AddCourse extends StatelessWidget {
  const AddCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarTheme("Add Courses"),
      body:
      BlocProvider(create: (_)=>InstructorBloc(CourseRepository()),
        child: SingleChildScrollView(
            child: AddcousresScreenForm()),
      )
    );

  }
}