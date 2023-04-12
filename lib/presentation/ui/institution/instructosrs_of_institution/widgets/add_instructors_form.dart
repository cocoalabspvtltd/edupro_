import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/presentation/ui/instructor/instructor_add_course/courses_dropdown.dart';
File? imageC;
class AddInstructorsForm extends StatefulWidget {
  const AddInstructorsForm({Key? key}) : super(key: key);

  @override
  State<AddInstructorsForm> createState() => _AddInstructorsFormState();
}

class _AddInstructorsFormState extends State<AddInstructorsForm> {
  final formKey = GlobalKey<FormState>();
  bool obscureText = true;
  String? fileName='';
  XFile? _image;
  final ImagePicker _picker = ImagePicker();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController qualificationcontroller = TextEditingController();
  TextEditingController mobilecontroller = TextEditingController();
  TextEditingController additionalmobilecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
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
        padding:
        const EdgeInsets.only(left: 15, right: 15, bottom: 15),
        children: <Widget>[
          SizedBox(height: screenHeight * .02),
          _textForm(
              namecontroller,
              "Name",
              true,
              TextInputType.name,
              maxLine: 1,
              hint: "Name"),
          const SizedBox(height: 10),
          _textForm(
              mobilecontroller,
              "Mobile",
              true,
              TextInputType.phone,
              maxLine: 1,
              hint: "Mobile"),
          const SizedBox(height: 10),
          _textForm(
              additionalmobilecontroller,
              "Additional Mobile",
              true,
              TextInputType.phone,
              maxLine: 1,
              hint: "Additional Mobile"),
          const SizedBox(height: 10),
          _textForm(
              qualificationcontroller,
              "Qualification",
              true,
              TextInputType.text,
              maxLine: 1,
              hint: "Qualification"),
          const SizedBox(height: 10),
          _textForm(
              descriptioncontroller,
              "Description",
              true,
              TextInputType.text,
              maxLine: 1,
              hint: "Description"),
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
                onPressed: () {

                },
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
  // fileName = ;
    });
    Get.back();
  }

  _imagefromComera(context) async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = photo;
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
