import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgs_edupro/application/institution_class/institution_class_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/course/course_repository.dart';
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
        body: BlocProvider(create: (_)=>InstitutionClassBloc(CourseRepository()),
          child: SingleChildScrollView(
              child: AddClassesForm()),)
    );
  }

}
