import 'package:flutter/material.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/presentation/ui/institution/classes_of_institution/widgets/add_classes_form.dart';

class AddClassesScreen extends StatefulWidget {
  final GlobalKey<FormState>? formKey;
  const AddClassesScreen({Key? key, this.formKey,}) : super(key: key);

  @override
  State<AddClassesScreen> createState() => _AddClassesScreenState();
}

class _AddClassesScreenState extends State<AddClassesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Add Classess",
            style: boldValuePrimaryColor,
          ),
        ),
        body:AddClassesForm(),
        // BlocProvider(create: (_)=>InsiistutionStudentBloc(CourseRepository()),
        //   child: SingleChildScrollView(
        //       child: AddStudentsForm()),)
    );
  }

}
