import 'package:flutter/material.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/presentation/ui/institution/jobs_of_intitution/widgets/add_job_form.dart';


class AddJobScreen extends StatefulWidget {
  final GlobalKey<FormState>? formKey;
  const AddJobScreen({Key? key, this.formKey,}) : super(key: key);

  @override
  State<AddJobScreen> createState() => _AddJobScreenState();
}

class _AddJobScreenState extends State<AddJobScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarTheme("Add Jobs"),
        body: SingleChildScrollView(
          child: AddJobsForm(),
        ),
        // body: BlocProvider(create: (_)=>InsiistutionStudentBloc(CourseRepository(),0),
        //   child: SingleChildScrollView(
        //       child: AddStudentsForm()),)
    );
  }

}
