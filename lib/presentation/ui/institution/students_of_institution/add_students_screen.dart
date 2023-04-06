import 'dart:io';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/presentation/ui/institution/students_of_institution/widgets/add_students_form.dart';
import 'package:pgs_edupro/presentation/ui/instructor/instructor_add_course/test.dart';

import '../../../../infrastructure/local_data_source/user.dart';
import 'package:http/http.dart' as http;

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
            "Add students",
            style: boldValuePrimaryColor,
          ),
        ),
        body: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      "Student Details",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                AddStudentsForm()
              ],
            ),
          ),
        ));
  }

}
