
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgs_edupro/application/school_edit_department/edit_department_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/school/department_list_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/course/course_repository.dart';
import 'package:pgs_edupro/presentation/ui/instructor/instructor_add_course/department_dropdown.dart';
import 'package:pgs_edupro/presentation/ui/school/departments/widgets/edit_department_form.dart';


class EditDepartmentScreen extends StatefulWidget {
   final depatmentdetails;
  const EditDepartmentScreen({super.key, required this.depatmentdetails});

  @override
  State<EditDepartmentScreen> createState() => _EditDepartmentScreenState();
}

class _EditDepartmentScreenState extends State<EditDepartmentScreen> {
  final formKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  void initState() {
    super.initState();

  }
  Widget build(BuildContext context) {
    print("details-->${widget.depatmentdetails.name}");
    print("details-->${widget.depatmentdetails.id}");
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Edit Department",
            style: boldValuePrimaryColor,
          ),
        ),
        body:
        BlocProvider(create: (_)=>EditDepartmentBloc(CourseRepository()),
          child: SingleChildScrollView(
              child: AddDepartmentsForm(
                  depatmentname:widget.depatmentdetails.name,
                departmentId:widget.depatmentdetails.id
              )),
        )
    );

  }

}
