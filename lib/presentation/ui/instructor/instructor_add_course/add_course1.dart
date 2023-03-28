import 'dart:io';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pgs_edupro/application/course/courses_bloc.dart';
import 'package:pgs_edupro/application/instructor/instructor_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/course/course_report_response.dart';
import 'package:pgs_edupro/presentation/ui/instructor/instructor_add_course/test.dart';
import 'package:pgs_edupro/presentation/widgets/common_result_empty_widget.dart';
import 'package:pgs_edupro/presentation/widgets/common_server_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddcousresScreenForm extends StatefulWidget {
  const AddcousresScreenForm({
    super.key,
  });

  @override
  State<AddcousresScreenForm> createState() => _AddcousresScreenFormState();
}

class _AddcousresScreenFormState extends State<AddcousresScreenForm> {
  String? fromDate;
  String? toDate;
  File? _image;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InstructorBloc, InstructorState>(
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
                  (r) => FlushbarHelper.createSuccess(message: "hgh" ?? '')
                  .show(context));
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
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(15),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    "Course Details",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              _textForm(
                  state.title,
                      (v) => context
                      .read<InstructorBloc>()
                      .add(InstructorEvent.titleChanged(v)),
                  null,
                  "Title",
                  'assets/icons/profile_icons/location.png',
                  TextInputType.streetAddress,
                  maxLine: 2),
              thickSpace,
              _textForm(
                  state.aboutTitle,
                      (v) => context
                      .read<InstructorBloc>()
                      .add(InstructorEvent.titleChanged(v)),
                  null,
                  "About title",
                  'assets/icons/profile_icons/location.png',
                  TextInputType.streetAddress,
                  maxLine: 2),
              thickSpace,
              thickSpace,
              Text(
                "Category",
                style: boldValue,
              ),
              thickSpace,
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
                  child: DesignationDropdown()),
              thickSpace,
              _textForm(
                  state.amount,
                      (v) => context
                      .read<InstructorBloc>()
                      .add(InstructorEvent.amountChanged(v)),
                  null,
                  "Amount",
                  'assets/icons/profile_icons/location.png',
                  TextInputType.number,
                  maxLine: 2),
              thickSpace,
              thickSpace,
              _textForm(
                  state.duration,
                      (v) => context
                      .read<InstructorBloc>()
                      .add(InstructorEvent.durationChanged(v)),
                  null,
                  "Duration",
                  'assets/icons/profile_icons/location.png',
                  TextInputType.number,
                  maxLine: 2),
              thickSpace,
              thickSpace,
              _textForm(
                  state.url,
                      (v) => context
                      .read<InstructorBloc>()
                      .add(InstructorEvent.urlChanged(v)),
                  null,
                  "Url",
                  'assets/icons/profile_icons/location.png',
                  TextInputType.number,
                  maxLine: 2),
              thickSpace,
              _image != null
                  ? Container(
                height: 100.00,
                child: Image.file(
                  File(_image!.path),
                  fit: BoxFit.fill,
                ),
              )
                  : InkWell(
                onTap: () {
                  pickImage();
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
                            pickImage();
                          },
                          icon: Icon(
                            Icons.file_present,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                ),
              ),
              _textForm(
                  state.description,
                      (v) => context
                      .read<InstructorBloc>()
                      .add(InstructorEvent.durationChanged(v)),
                  null,
                  "Description",
                  'assets/icons/profile_icons/location.png',
                  TextInputType.number,
                  maxLine: 2),
              thickSpace,
              Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    "Course Descrption Details",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              thickSpace,
              _textForm(
                  state.whatYouLearn,
                      (v) => context
                      .read<InstructorBloc>()
                      .add(InstructorEvent.whatYChanged(v)),
                  null,
                  "What You Learn",
                  'assets/icons/profile_icons/location.png',
                  TextInputType.text,
                  maxLine: 2),
              thickSpace,
              _textForm(
                  state.areThere,
                      (v) => context
                      .read<InstructorBloc>()
                      .add(InstructorEvent.areThereAnyChanged(v)),
                  null,
                  "Are There Any Changed",
                  'assets/icons/profile_icons/location.png',
                  TextInputType.text,
                  maxLine: 2),
              thickSpace,
              _textForm(
                  state.whoIsThis,
                      (v) => context
                      .read<InstructorBloc>()
                      .add(InstructorEvent.whoThisChanged(v)),
                  null,
                  "who IsT his",
                  'assets/icons/profile_icons/location.png',
                  TextInputType.text,
                  maxLine: 2),
              thickSpace,
              thickSpace,
              SizedBox(
                height: 50,
                width: screenWidth / 2 - 20,
                child: ElevatedButton(
                  onPressed:() => context
                      .read<InstructorBloc>()
                      .add(const InstructorEvent.submitPressed()),
                  style: ElevatedButton.styleFrom(
                      elevation: 4, disabledBackgroundColor: Colors.grey
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(50),
                    //),
                  ),
                  child: const Text('Save And Update'),
                ),
              ),
              thickSpace,
              thickSpace,
              if (state.isSubmitting) ...[
                const SizedBox(height: 8),
                const LinearProgressIndicator(value: null),
              ],
              thickSpace,
              thickSpace,
            ],
          ),
        );
      },
    );
  }
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      _image = File(image.path);
      print(("=>${_image}"));
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

