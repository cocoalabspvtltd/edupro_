import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgs_edupro/application/institution_course/institution_course_bloc.dart';
import 'package:pgs_edupro/application/school_department/school_department_bloc.dart';

import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/course/course_repository.dart';
import 'package:pgs_edupro/presentation/ui/institution/courses_of_insisitution/widgets/add_course_form.dart';
import 'package:pgs_edupro/presentation/ui/institution/students_of_institution/widgets/add_students_form.dart';
import 'package:pgs_edupro/presentation/ui/school/departments/widgets/add_department_form.dart';


class AddDepartmentsScreen extends StatefulWidget {
  final GlobalKey<FormState>? formKey;
  const AddDepartmentsScreen({Key? key, this.formKey,}) : super(key: key);

  @override
  State<AddDepartmentsScreen> createState() => _AddDepartmentsScreenState();
}

class _AddDepartmentsScreenState extends State<AddDepartmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarTheme("Add Departments"),
        body:
        BlocProvider(create: (_)=>SchoolDepartmentBloc(CourseRepository()),
          child: SingleChildScrollView(
              child: AddDepartmentsForm()),
        )
    );
  }

}
