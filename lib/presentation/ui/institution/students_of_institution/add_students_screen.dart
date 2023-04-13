import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgs_edupro/application/insistutionStudent/insiistution_student_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/course/course_repository.dart';
import 'package:pgs_edupro/presentation/ui/institution/students_of_institution/widgets/add_students_form.dart';

class AddStudentScreen extends StatefulWidget {
  final GlobalKey<FormState>? formKey;
  const AddStudentScreen({Key? key, this.formKey,}) : super(key: key);

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
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
        BlocProvider(create: (_)=>InsiistutionStudentBloc(CourseRepository()),
          child: SingleChildScrollView(
              child: AddStudentsForm()),)
    );
  }

}
