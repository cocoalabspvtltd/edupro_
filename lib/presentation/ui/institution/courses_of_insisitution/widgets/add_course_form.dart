import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/presentation/ui/instructor/instructor_add_course/courses_dropdown.dart';
File? imageCourseC;
class AddCoursesForm extends StatefulWidget {
  const AddCoursesForm({Key? key}) : super(key: key);

  @override
  State<AddCoursesForm> createState() => _AddCoursesFormState();
}

class _AddCoursesFormState extends State<AddCoursesForm> {
  final formKey = GlobalKey<FormState>();
  bool obscureText = true;
  XFile? _image;
  final ImagePicker _picker = ImagePicker();
  TextEditingController title=TextEditingController();
  TextEditingController about_title=TextEditingController();
  TextEditingController duration=TextEditingController();
  TextEditingController amount=TextEditingController();
  TextEditingController url=TextEditingController();
  TextEditingController courses=TextEditingController();
  TextEditingController requirements=TextEditingController();
  TextEditingController learn=TextEditingController();
  TextEditingController des=TextEditingController();
  @override
  void initState() {
    super.initState();
    CoursesDropdown();
  }
  Widget build(BuildContext context) {
    return  Form(
      key: formKey,
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(left: 15,right: 15),
        children: <Widget>[
          const SizedBox(
            height: 25,
          ),
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              "Course Details",
              style:
              TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: screenHeight * .02),
          _textForm(
              title,
              //     (v) => context
              //     .read<InstitutionInstructorBloc>()
              //     .add(InstitutionInstructorEvent.nameChanged(v)),
              // null,
              "Title",
              true,
              TextInputType.streetAddress,
              maxLine: 1,
              hint: "Title"),
          const SizedBox(height: 10),
          _textForm(
              about_title,
              //     (v) => context
              //     .read<InstitutionInstructorBloc>()
              //     .add(InstitutionInstructorEvent.mobileChanged(v)),
              // null,
              "About Title",
              true,
              TextInputType.streetAddress,
              maxLine: 1,
              hint: "Mobile"),
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
          Text("Instrcutors",style: TextStyle(color: Colors.black,fontSize: 16),),
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
          _textForm(
              amount,
              //     (v) => context
              //     .read<InstitutionInstructorBloc>()
              //     .add(InstitutionInstructorEvent.additionalmobileChanged(v)),
              // null,
              "Amount",
              true,
              TextInputType.number,
              maxLine: 1,
              hint: "Amount"),
          const SizedBox(height: 10),
          _textForm(
              duration,
              //     (v) => context
              //     .read<InstitutionInstructorBloc>()
              //     .add(InstitutionInstructorEvent.qualificationChanged(v)),
              // null,
              "Duration",
              true,
              TextInputType.number,
              maxLine: 1,
              hint: "Duration"),
          const SizedBox(height: 10),
          _textForm(
              url,
              //     (v) => context
              //     .read<InstitutionInstructorBloc>()
              //     .add(InstitutionInstructorEvent.descriptionChanged(v)),
              // null,
              "Url",
              true,
              TextInputType.text,
              maxLine: 1,
              hint: "Url"),
          const SizedBox(height: 10),
          Text("Course Picture",style: TextStyle(color: Colors.black,fontSize: 16),),
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
          _textForm(
              des,
              //     (v) => context
              //     .read<InstitutionInstructorBloc>()
              //     .add(InstitutionInstructorEvent.descriptionChanged(v)),
              // null,
              "Description",
              true,
              TextInputType.text,
              maxLine: 1,
              hint: "Description"),
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
              learn,
              //     (v) => context
              //     .read<InstructorBloc>()
              //     .add(InstructorEvent.whatYChanged(v)),
              // null,
              "What You Learn",
              true,
              TextInputType.text,
              maxLine: 2),
          thickSpace,
          _textForm(
              requirements,
              //     (v) => context
              //     .read<InstructorBloc>()
              //     .add(InstructorEvent.areThereAnyChanged(v)),
              // null,

              "Are There Any Changed",
              true,
              TextInputType.text,
              maxLine: 2),
          thickSpace,
          _textForm(
             courses,
              //     (v) => context
              //     .read<InstructorBloc>()
              //     .add(InstructorEvent.whoThisChanged(v)),
              // null,
              "who IsT his",
              true,
              TextInputType.text,
              maxLine: 2),
          thickSpace,
          thickSpace,
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: (){},
                // onPressed:() => context
                //     .read<InstitutionInstructorBloc>()
                //     .add(InstitutionInstructorEvent.submitPressed()),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text('Submit'),
              ),
            ),
          ),
          thickSpace,
          thickSpace,
        ],
      ),
    );
    //   BlocConsumer<InstitutionInstructorBloc, InstitutionInstructorState>(
    //   listener: (context, state) {
    //     state.loadFailureOrSuccessOption.fold(
    //           () {},
    //           (either) {
    //         either.fold(
    //               (failure) {
    //             FlushbarHelper.createError(
    //               message: failure.map(
    //                 unexpected: (value) => 'Unexpected Error',
    //                 serverError: (value) => 'Server Error',
    //                 serverTimeOut: (value) => 'Server Timed Out',
    //                 unAuthorized: (value) => value.message,
    //                 nullData: (value) => 'Data Not Found',
    //               ),
    //             ).show(context);
    //           },
    //               (res) {},
    //         );
    //       },
    //     );
    //     state.submitFailedOrSuccessOption.fold(() {}, (either) {
    //       either.fold((failure) {
    //         FlushbarHelper.createError(
    //           message: failure.map(
    //             unexpected: (value) => 'Unexpected Error',
    //             serverError: (value) => 'Server Error',
    //             serverTimeOut: (value) => 'Server Timed Out',
    //             unAuthorized: (value) => value.message,
    //             nullData: (value) => 'Data Not Found',
    //           ),
    //         ).show(context);
    //       },
    //
    //               (r) => Fluttertoast.showToast(msg: "Instructor added successfully"));
    //     });
    //   },
    //   builder: (context, state) {
    //     return state.isLoading
    //         ? SizedBox(
    //       height: screenHeight - 180,
    //       child: const Center(child: CircularProgressIndicator()),
    //     )
    //         :    Form(
    //       key: formKey,
    //       child: ListView(
    //         shrinkWrap: true,
    //         physics: const NeverScrollableScrollPhysics(),
    //         padding: const EdgeInsets.only(left: 15,right: 15),
    //         children: <Widget>[
    //           const SizedBox(
    //             height: 25,
    //           ),
    //           Align(
    //             alignment: AlignmentDirectional.topStart,
    //             child: Text(
    //               "Instructor Details",
    //               style:
    //               TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    //             ),
    //           ),
    //           SizedBox(height: screenHeight * .02),
    //           _textForm(
    //               state.name,
    //                   (v) => context
    //                   .read<InstitutionInstructorBloc>()
    //                   .add(InstitutionInstructorEvent.nameChanged(v)),
    //               null,
    //               "Name",
    //               true,
    //               TextInputType.name,
    //               maxLine: 1,
    //               hint: "Name"),
    //           const SizedBox(height: 10),
    //           _textForm(
    //               state.mobile,
    //                   (v) => context
    //                   .read<InstitutionInstructorBloc>()
    //                   .add(InstitutionInstructorEvent.mobileChanged(v)),
    //               null,
    //               "Mobile",
    //               true,
    //               TextInputType.phone,
    //               maxLine: 1,
    //               hint: "Mobile"),
    //           const SizedBox(height: 10),
    //           _textForm(
    //               state.addtionalmobile,
    //                   (v) => context
    //                   .read<InstitutionInstructorBloc>()
    //                   .add(InstitutionInstructorEvent.additionalmobileChanged(v)),
    //               null,
    //               "Additional Mobile",
    //               true,
    //               TextInputType.phone,
    //               maxLine: 1,
    //               hint: "Additional Mobile"),
    //           const SizedBox(height: 10),
    //           _textForm(
    //               state.qualification,
    //                   (v) => context
    //                   .read<InstitutionInstructorBloc>()
    //                   .add(InstitutionInstructorEvent.qualificationChanged(v)),
    //               null,
    //               "Qualification",
    //               true,
    //               TextInputType.text,
    //               maxLine: 1,
    //               hint: "Qualification"),
    //           const SizedBox(height: 10),
    //           _textForm(
    //               state.description,
    //                   (v) => context
    //                   .read<InstitutionInstructorBloc>()
    //                   .add(InstitutionInstructorEvent.descriptionChanged(v)),
    //               null,
    //               "Description",
    //               true,
    //               TextInputType.text,
    //               maxLine: 1,
    //               hint: "Description"),
    //           const SizedBox(height: 10),
    //           Text("Courses",style: TextStyle(color: Colors.black,fontSize: 16),),
    //           const SizedBox(height: 10),
    //           Container(
    //               width: screenWidth,
    //               height: 45,
    //               decoration: BoxDecoration(
    //                 border: Border.all(
    //                   color: Colors.grey,
    //                 ),
    //                 borderRadius:
    //                 BorderRadius.all(Radius.circular(7.0)),
    //               ),
    //               child: CoursesDropdown()),
    //           const SizedBox(height: 10),
    //           Text("Profile Photo",style: TextStyle(color: Colors.black,fontSize: 16),),
    //           const SizedBox(height: 10),
    //           _image != null
    //               ? Text("${_image?.path.split('/').last}")
    //               : InkWell(
    //             onTap: () {
    //               _showpicker;
    //             },
    //             child: Container(
    //               height: 45,
    //               decoration: BoxDecoration(
    //                 border: Border.all(color: Colors.grey),
    //                 borderRadius:
    //                 BorderRadius.all(Radius.circular(7.0)),
    //               ),
    //               child: Row(
    //                 children: [
    //                   SizedBox(
    //                     width: 10,
    //                   ),
    //                   Text(
    //                     "Choose file",
    //                     style: TextStyle(
    //                         color: Colors.black54, fontSize: 18),
    //                   ),
    //                   Spacer(),
    //                   IconButton(
    //                       onPressed: () {
    //                         _showpicker(context);
    //                       },
    //                       icon: Icon(
    //                         Icons.file_present,
    //                         color: Colors.grey,
    //                       ))
    //                 ],
    //               ),
    //             ),
    //           ),
    //           thickSpace,
    //           Card(
    //             child: Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Column(
    //                 children: [
    //                   Text("Login details",style:boldHeading ,),
    //                   _textForm(
    //                       state.email,
    //                           (v) => context
    //                           .read<InstitutionInstructorBloc>()
    //                           .add(InstitutionInstructorEvent.emailChanged(v)),
    //                       null,
    //                       "Email",
    //                       true,
    //                       TextInputType.text,
    //                       maxLine: 1,
    //                       hint: "Email"),
    //                   thickSpace,
    //                   _textForm(
    //                       state.password,
    //                           (v) => context
    //                           .read<InstitutionInstructorBloc>()
    //                           .add(InstitutionInstructorEvent.passwordChanged(v)),
    //                       null,
    //                       "Password",
    //                       true,
    //                       TextInputType.text,
    //                       maxLine: 1,
    //                       hint: "Password"),
    //                 ],
    //               ),
    //             ),
    //           ),
    //           thickSpace,
    //           Padding(
    //             padding: const EdgeInsets.only(left: 10, right: 10),
    //             child: SizedBox(
    //               height: 50,
    //               child: ElevatedButton(
    //                 onPressed:() => context
    //                     .read<InstitutionInstructorBloc>()
    //                     .add(InstitutionInstructorEvent.submitPressed()),
    //                 style: ElevatedButton.styleFrom(
    //                   shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(5),
    //                   ),
    //                 ),
    //                 child: const Text('Submit'),
    //               ),
    //             ),
    //           ),
    //           thickSpace,
    //           thickSpace,
    //         ],
    //       ),
    //     );
    //   },
    // );

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

  Widget _textForm(
      TextEditingController controller,
      // onChanged,
      // validator,
      String label,
      bool editable,
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
          style: TextStyle(color: Colors.black,fontSize: 16),
        ),
        thickSpace,
        TextFormField(
          enabled: editable,
          controller: controller,
          maxLines: maxLine,
          // onChanged: onChanged,
          // validator: validator,
          keyboardType: keyboardType,
          inputFormatters: formatter,
          style: const TextStyle(
              fontWeight: FontWeight.w500, color: Colors.black87),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            hintText: hint,
            hintStyle: TextStyle(color:Colors.black54 ),
            //filled: true,
            fillColor: primaryColor[100],
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.grey)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.grey, width: 1)),
          ),
        ),
      ],
    );
  }

  _imagefromGallery(context) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image= image;
      imageCourseC = File(_image!.path);
    });
    Get.back();
  }

  _imagefromComera(context) async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = photo;
      imageCourseC = File(_image!.path);
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
}
