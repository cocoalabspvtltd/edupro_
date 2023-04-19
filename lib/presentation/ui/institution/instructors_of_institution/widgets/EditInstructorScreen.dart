import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgs_edupro/application/institution_instructor/institution_instructor_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/course/course_repository.dart';
import 'package:pgs_edupro/presentation/ui/institution/instructors_of_institution/widgets/add_instructors_form.dart';

import 'EditInstructorScreen1.dart';


class EditInstructorScreen extends StatefulWidget {
  final GlobalKey<FormState>? formKey;
  final depatmentdetails;
  final depatmentdetailsid;
  const EditInstructorScreen({Key? key, this.formKey, this.depatmentdetails, this.depatmentdetailsid,}) : super(key: key);

  @override
  State<EditInstructorScreen> createState() => _EditInstructorScreenState();
}

class _EditInstructorScreenState extends State<EditInstructorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Add Instructors",
            style: boldValuePrimaryColor,
          ),
        ),
        body:  BlocProvider(
            create: (context) => InstitutionInstructorBloc(
              CourseRepository(),
              widget.depatmentdetailsid,
            )..add(InstitutionInstructorEvent.loadMyProfile(
                widget.depatmentdetails.id.toString())),
            child: Scaffold(
              body: RefreshIndicator(
                  onRefresh: () async {
                    context.read<InstitutionInstructorBloc>().add(
                        InstitutionInstructorEvent.loadMyProfile(
                            (widget.depatmentdetails.id.toString())));
                  },
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: EditInstructorsForm(depatmentdetails: widget.depatmentdetails,),
                  )),
            )));
  }

}
