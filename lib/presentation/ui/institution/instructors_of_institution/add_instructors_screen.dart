import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgs_edupro/application/institution_instructor/institution_instructor_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/course/course_repository.dart';
import 'package:pgs_edupro/presentation/ui/institution/instructors_of_institution/widgets/add_instructors_form.dart';


class AddInstructorScreen extends StatefulWidget {
  final GlobalKey<FormState>? formKey;
  const AddInstructorScreen({Key? key, this.formKey,}) : super(key: key);

  @override
  State<AddInstructorScreen> createState() => _AddInstructorScreenState();
}

class _AddInstructorScreenState extends State<AddInstructorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarTheme("Add Instructors"),
        body: BlocProvider(create: (_)=>InstitutionInstructorBloc(CourseRepository(),0),
          child: SingleChildScrollView(
              child:  AddInstructorsForm()
          ),
        )

       );
  }

}
