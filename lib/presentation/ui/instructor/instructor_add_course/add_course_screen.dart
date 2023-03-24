import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/presentation/ui/instructor/instructor_add_course/test.dart';


class AddCourseScreen extends StatefulWidget {
  final GlobalKey<FormState>? formKey;
  const AddCourseScreen({Key? key, this.formKey}) : super(key: key);
  @override
  State<AddCourseScreen> createState() => _AddCourseScreenState();
}

class _AddCourseScreenState extends State<AddCourseScreen> {
  final formKey = GlobalKey<FormState>();

  String? dropdownvalue;
  var category=[
   "Education","Food","sales"
  ];
  String? dropdownvalue1;
  var instructor=[
    "instructor1","instructor2","instructor3"
  ];
  bool obscureText = true;
  XFile? _image;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Add Courses",
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
                        height: 30,
                      ),
                      Text(
                        "Create Your Course",
                        style: boldWordPrimarycolor,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            "Course Details",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Form(
                        key: formKey,
                        child: ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
                          children: <Widget>[
                            SizedBox(height: screenHeight * .02),
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                labelText: 'Title',
                              ),
                              autocorrect: false,
                              // onChanged: (value) => context
                              //     .read<LogInBloc>()
                              //     .add(LogInEvent.nameChanged(value)),
                              // validator: (_) =>
                              //     context.read<LogInBloc>().state.name.value.fold(
                              //           (f) => f.maybeMap(
                              //         invalidName: (_) => 'Invalid Name',
                              //         empty: (_) => 'Name cannot be empty',
                              //         orElse: () => null,
                              //       ),
                              //           (_) => null,
                              //     ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                labelText: 'About title',
                              ),
                              autocorrect: false,
                              // onChanged: (value) => context
                              //     .read<LogInBloc>()
                              //     .add(LogInEvent.nameChanged(value)),
                              // validator: (_) =>
                              //     context.read<LogInBloc>().state.name.value.fold(
                              //           (f) => f.maybeMap(
                              //         invalidName: (_) => 'Invalid Name',
                              //         empty: (_) => 'Name cannot be empty',
                              //         orElse: () => null,
                              //       ),
                              //           (_) => null,
                              //     ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              width: screenWidth,
                            height: 45,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey,),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(7.0)),
                            ),
                            child: DesignationDropdown()
                          ),
                            const SizedBox(height: 20),
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                labelText: 'Amount',
                              ),
                              autocorrect: false,
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                labelText: 'Duration',
                              ),
                              autocorrect: false,
                            ),
                            const SizedBox(height: 20),
                            Container(
                              width: screenWidth,
                              height: 45,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(7.0)),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10),
                                  child: DropdownButton(
                                    value: dropdownvalue1,
                                    hint: Text("Instructor"),
                                    items: instructor.map((String items) {
                                      return DropdownMenuItem(
                                          value: items,
                                          child: Text(
                                            items,
                                            style: TextStyle(color:Colors.black, fontSize: 14),
                                          ));
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue1 = newValue!;
                                        print("value->..>>..>>>>>${dropdownvalue1}");
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                labelText: 'Url',
                              ),
                              autocorrect: false,
                            ),
                            const SizedBox(height: 20),
                            _image != null ?
                            Container(
                              height:
                              100.00,
                              child: Image.file(
                                File(_image!.path),
                                fit: BoxFit.fill,
                              ),
                            ):
                            InkWell(
                              onTap: (){
                                _showpicker(context);
                              },
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(7.0)
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: 10,),
                                    Text("Choose file",style: TextStyle(color: Colors.black54,fontSize: 18),),
                                    Spacer(),
                                    IconButton(onPressed: (){
                                      _showpicker(context);
                                    }, icon: Icon(Icons.file_present,color: Colors.grey,))
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                labelText: 'Description',
                              ),
                              autocorrect: false,
                            ),
                            const SizedBox(height: 25),
                            Text("Course Descrption Details",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                            const SizedBox(height: 20),
                            Text("What you ll learn"),
                            const SizedBox(height: 10),
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                              ),
                              autocorrect: false,
                            ),
                            const SizedBox(height: 20),
                            const Text("Are there any course requirements or prerequisites ?"),
                            const SizedBox(height: 10),
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                              ),
                              autocorrect: false,
                            ),
                            const SizedBox(height: 20),
                            Text("Who this course is for ?"),
                            const SizedBox(height: 10),
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                              ),
                              autocorrect: false,
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
                      ),
                    ],
                  ),
                ),
              )
      );
  }

  _imagefromGallery(context) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
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


