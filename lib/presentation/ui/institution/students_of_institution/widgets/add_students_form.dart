import 'dart:io';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pgs_edupro/application/insistution_student/insistution_student_bloc.dart';
import 'package:pgs_edupro/application/instructor/instructor_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/presentation/ui/instructor/instructor_add_course/courses_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../instructor/instructor_add_course/department_dropdown.dart';

File? imageStudent;
class AddStudentsForm extends StatefulWidget {
  const AddStudentsForm({
    super.key,
  });

  @override
  State<AddStudentsForm> createState() => _AddStudentsFormState();
}

class _AddStudentsFormState extends State<AddStudentsForm> {
  String? fromDate;
  String? toDate;
  XFile? _image;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InsistutionStudentBloc, InsistutionStudentState>(
      listener: (context, state) {
        state.loadFailureOrSuccessOption.fold(
              () {},
              (either) {
            either.fold(
                  (failure) {
                FlushbarHelper.createError(
                  message: failure.map(
                    unexpected: (value) => 'Unexpected Error',
                    serverError: (value) => 'Server Error',
                    serverTimeOut: (value) => 'Server Timed Out',
                    unAuthorized: (value) => value.message,
                    nullData: (value) => 'Data Not Found',
                  ),
                ).show(context);
              },
                  (res) {},
            );
          },
        );
        state.submitFailedOrSuccessOption.fold(() {}, (either) {
          either.fold((failure) {
            FlushbarHelper.createError(
              message: failure.map(
                unexpected: (value) => 'Unexpected Error',
                serverError: (value) => 'Server Error',
                serverTimeOut: (value) => 'Server Timed Out',
                unAuthorized: (value) => value.message,
                nullData: (value) => 'Data Not Found',
              ),
            ).show(context);
          },

                  (r) => Fluttertoast.showToast(msg: "Course added successfully"));
        });
      },
      builder: (context, state) {
        return state.isLoading
            ? SizedBox(
          height: screenHeight - 180,
          child: const Center(child: CircularProgressIndicator()),
        )
            : Form(
          // key: _formKey,
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child:

          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding:
            const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            children: <Widget>[
              SizedBox(height: screenHeight * .02),
              _textForm(
                  state.name,
                      (v) => context
                      .read<InsistutionStudentBloc>()
                      .add(InsistutionStudentEvent.name(v)),
                  null,
                  "Name",
                  'assets/icons/profile_icons/location.png',
                  TextInputType.streetAddress,
                  maxLine: 2),
              thickSpace,
              _textForm(
                  state.email,
                      (v) => context
                      .read<InsistutionStudentBloc>()
                      .add(InsistutionStudentEvent.emailChanged(v)),
                  null,
                  "Email",
                  'assets/icons/profile_icons/location.png',
                  TextInputType.streetAddress,
                  maxLine: 2),
              thickSpace,
              _textForm(
                  state.mobile,
                      (v) => context
                      .read<InsistutionStudentBloc>()
                      .add(InsistutionStudentEvent.mobileChanged(v)),
                  null,
                  "Mobile",
                  'assets/icons/profile_icons/location.png',
                  TextInputType.streetAddress,
                  maxLine: 2),
              thickSpace,
              _textForm(
                  state.additionalMobile,
                      (v) => context
                      .read<InsistutionStudentBloc>()
                      .add(InsistutionStudentEvent.additionalNumChanged(v)),
                  null,
                  "Add Number",
                  'assets/icons/profile_icons/location.png',
                  TextInputType.streetAddress,
                  maxLine: 2),
              thickSpace,
              _textForm(
                  state.address,
                      (v) => context
                      .read<InsistutionStudentBloc>()
                      .add(InsistutionStudentEvent.addressChanged(v)),
                  null,
                  "Add Number",
                  'assets/icons/profile_icons/location.png',
                  TextInputType.streetAddress,
                  maxLine: 2),
              thickSpace,
              Text(
                "Date of Birth",
                style: boldValue,
              ),
              thickSpace,
              DateTimeFormField(

                dateTextStyle: const TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 15),

                //dateFormat: DateFormat.yMd(),
                decoration: InputDecoration(
                  fillColor: primaryColor[100],
                  prefixIcon: Image.asset(
                      'assets/icons/profile_icons/calender_theme.png'),

                  prefixIconConstraints: const BoxConstraints(
                    maxHeight: 30,
                    minHeight: 30,
                    maxWidth: 50,
                    minWidth: 50,
                  ),
                  hintStyle: TextStyle(color: primaryColor[200]),
                  border: const OutlineInputBorder(),
                  // suffixIcon: const Icon(Icons.event_note),


                ), mode: DateTimeFieldPickerMode.date,
                //firstDate: DateTime.now().add(const Duration(days: 10)),
                lastDate: DateTime.now().add(const Duration(days: 40)),
                // initialDate:
                //     DateTime.now().add(const Duration(days: 20)),
                autovalidateMode: AutovalidateMode.always,
                onDateSelected: (DateTime value) => context
                    .read<InsistutionStudentBloc>()
                    .add(InsistutionStudentEvent.dobChanged(
                    DateFormat("MM/dd/yyyy").format(value))),
              ),
              const SizedBox(height: 10),
              Text("Courses",style: TextStyle(color: Colors.black,fontSize: 16),),
              const SizedBox(height: 10),
              Container(
                  width: screenWidth,
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius:
                    BorderRadius.all(Radius.circular(7.0)),
                  ),
                  child: CoursesDropdown()),
              const SizedBox(height: 10),
              Text("Courses",style: TextStyle(color: Colors.black,fontSize: 16),),
              const SizedBox(height: 10),
              Container(
                  width: screenWidth,
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius:
                    BorderRadius.all(Radius.circular(7.0)),
                  ),
                  child: DepartmentDropdown()),
              const SizedBox(height: 10),
              Text("Profile Photo",style: TextStyle(color: Colors.black,fontSize: 16),),
              const SizedBox(height: 10),
              _image != null
                  ? Text("${_image?.path.split('/').last}")
                  : InkWell(
                onTap: () {
                  _showpicker;
                },
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius:
                    BorderRadius.all(Radius.circular(7.0)),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Choose file",
                        style: TextStyle(
                            color: Colors.black54, fontSize: 18),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            _showpicker(context);
                          },
                          icon: Icon(
                            Icons.file_present,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                ),
              ),
              thickSpace,
              thickSpace,
              thickSpace,
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed:() => context
                        .read<InsistutionStudentBloc>()
                        .add( InsistutionStudentEvent.submitPressed()),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),

                    child: const Text('Submit'),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  final ImagePicker _picker = ImagePicker();
  _imagefromGallery(context) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image!;
      print("wqswq=>${_image}");
      imageStudent = File(_image!.path);
      print("->>${imageStudent}");

    });
    Get.back();
  }

  _imagefromComera(context) async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = photo!;
      print("wqswq=>${_image}");
      imageStudent = File(_image!.path);
      print("->>${imageStudent}");
    });
    Get.back();
  }

  _showpicker(context) {
    showModalBottomSheet(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        backgroundColor: Colors.white,
        context: context,
        builder: (context) {
          return SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(width: screenWidth * 0.1),
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: primaryColor,
                        child: IconButton(
                          onPressed: () {
                            _imagefromComera(context);
                          },
                          icon: const Icon(Icons.camera_alt_rounded,
                              color: Colors.white),
                          iconSize: 30,
                        ),
                      ),
                      const Text("Camera"),
                    ],
                  ),
                  SizedBox(width: screenWidth * 0.08),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: primaryColor,
                        child: IconButton(
                          onPressed: () {
                            _imagefromGallery(context);
                          },
                          icon: const Icon(Icons.photo),
                          color: Colors.white,
                          iconSize: 30,
                        ),
                      ),
                      const Text("Gallery"),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      _image = XFile(image.path);


      setState(() {});
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

}
Widget _textForm(
    TextEditingController controller,
    onChanged,
    validator,
    String label,
    String prefixIconAssetPath,
    TextInputType keyboardType, {
      List<TextInputFormatter>? formatter,
      String? hint,
      int maxLine = 1,
    }) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: boldValue,
      ),
      thickSpace,
      TextFormField(

        controller: controller,
        maxLines: maxLine,
        onChanged: onChanged,
        validator: validator,
        keyboardType: keyboardType,
        inputFormatters: formatter,
        style: const TextStyle(
            fontWeight: FontWeight.w500, color: Colors.black87),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: primaryColor[200]),
          //filled: true,
          fillColor: primaryColor[100],

          prefixIconConstraints: const BoxConstraints(
            maxHeight: 30,
            minHeight: 30,
            maxWidth: 50,
            minWidth: 50,
          ),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor[100]!)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor, width: 2)),
        ),
      ),
    ],
  );
}

