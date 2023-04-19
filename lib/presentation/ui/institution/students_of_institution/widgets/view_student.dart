import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/kt.dart';
import 'package:pgs_edupro/application/insistutionStudent/insiistution_student_bloc.dart';
import 'package:pgs_edupro/application/school_edit_department/edit_department_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/school/department_list_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/course/course_repository.dart';
import 'package:pgs_edupro/presentation/ui/instructor/instructor_add_course/department_dropdown.dart';
import 'package:pgs_edupro/presentation/ui/school/departments/widgets/edit_department_form.dart';

import 'insistution_view.dart';

class EditStudentScreen extends StatefulWidget {
  final depatmentdetails;
  final depatmentdetailsid;
  const  EditStudentScreen(
      {super.key, required this.depatmentdetails, this.depatmentdetailsid});

  @override
  State<EditStudentScreen> createState() => _EditStudentScreenState();
}

class _EditStudentScreenState extends State<EditStudentScreen> {
  final formKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  void initState() {
    super.initState();
    print("f=>${widget.depatmentdetailsid}");
  }

  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Edit Student",
            style: boldValuePrimaryColor,
          ),
        ),


        body: BlocProvider(
          create: (context) => InsiistutionStudentBloc(
            CourseRepository(),
            widget.depatmentdetailsid,
          )..add(InsiistutionStudentEvent.loadMyProfile(
              widget.depatmentdetails.id.toString())),
          child: Scaffold(
              body: RefreshIndicator(
            onRefresh: () async {
              context.read<InsiistutionStudentBloc>().add(
                  InsiistutionStudentEvent.loadMyProfile(
                      (widget.depatmentdetails.id.toString())));
            },
            child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: AddStudentsFormEdit(depatmentdetails: widget.depatmentdetails,),
          )),
        )));
  }
}
