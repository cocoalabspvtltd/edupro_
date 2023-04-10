import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/presentation/ui/institution/instructosrs_of_institution/widgets/add_instructors_form.dart';


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
                      "Instructor Details",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                AddInstructorsForm()
              ],
            ),
          ),
        ));
  }

}
