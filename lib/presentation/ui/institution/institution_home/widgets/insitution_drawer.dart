import 'package:cached_network_image/cached_network_image.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/shared_prefs.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/presentation/ui/institution/classes_of_institution/add_classes_screen.dart';
import 'package:pgs_edupro/presentation/ui/institution/classes_of_institution/classes_list_screen.dart';
import 'package:pgs_edupro/presentation/ui/institution/courses_of_insisitution/add_course_screen.dart';
import 'package:pgs_edupro/presentation/ui/institution/institution_home/institution_home_screen.dart';
import 'package:pgs_edupro/presentation/ui/institution/instructors_of_institution/add_instructors_screen.dart';
import 'package:pgs_edupro/presentation/ui/institution/instructors_of_institution/instructors_list_screen.dart';
import 'package:pgs_edupro/presentation/ui/institution/students_of_institution/add_students_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pgs_edupro/presentation/ui/institution/students_of_institution/student_list_screen.dart';

import '../../courses_of_insisitution/courses_list.dart';

class InstitutionDrawerWidget extends StatelessWidget {
  final BuildContext context;
  final GlobalKey<ScaffoldState> scaffoldKey;
  const InstitutionDrawerWidget(
      {super.key, required this.context, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return _drawer();
  }

  Widget _drawer() {
    return SafeArea(
      child: Drawer(
        elevation: 0,
        shape: const RoundedRectangleBorder(),
        backgroundColor: Colors.white,
        width: screenWidth - (screenWidth / 5),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Material(
              color: Colors.white,
              child: SafeArea(
                child: InkWell(
                  onTap: () {
                    scaffoldKey.currentState!.openEndDrawer();
                    // setState(() {
                    //   _selectedIndex = 1;
                    // });
                  },
                  child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: Row(mainAxisSize: MainAxisSize.max, children: [
                        InkWell(
                          onTap: () {
                            Get.offAll(() => const InstitutionHomeScreen(
                                  selectedIndex: 3,
                                ));
                          },
                          child: Container(
                              width: screenWidth * .14,
                              height: screenWidth * .14,
                              padding: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: UserDetailsLocal.storageBaseUrl +
                                      UserDetailsLocal.userImageUrl,
                                  placeholder: (context, url) => Container(
                                    margin: const EdgeInsets.all(1),
                                    child: const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    margin: const EdgeInsets.all(0),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover)),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                    width: screenWidth * .14,
                                    height: screenWidth * .14,
                                    padding: const EdgeInsets.all(5),
                                    child: const Image(
                                      image: AssetImage(
                                          'assets/icons/drawer_icons/display-picture-sltd.png'),
                                      height: double.infinity,
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                              )),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "${UserDetailsLocal.userName}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "${UserDetailsLocal.userEmail}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        )),
                        Icon(
                          Icons.close,
                          color: Colors.black,
                        )
                      ])),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white, //secondaryColor[100],
                padding: const EdgeInsets.all(2),
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    ExpansionTile(
                      title: Text(
                        "Classes",
                        style: TextStyle(fontSize: 16),
                      ),
                      leading: Container(
                        height: 38,
                        width: 38.0,
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: primaryColor),
                          color: primaryColor[50],
                        ),
                        child: Image.asset(
                            'assets/icons/drawer_icons/my-course-sltd.png'),
                      ),
                      childrenPadding:
                          EdgeInsets.only(left: 60), //children padding
                      children: [
                        ListTile(
                          title: Text("Class list"),
                          onTap: () {
                            Get.to(() => InsistutionClassesListScreen());

                          },
                        ),
                        ListTile(
                          title: Text("Add class"),
                          onTap: () {
                            Get.to(() => AddClassesScreen());
                          },
                        ),
                        //more child menu
                      ],
                    ),
                    ExpansionTile(
                      title: Text(
                        "Courses",
                        style: TextStyle(fontSize: 16),
                      ),
                      leading: Container(
                        height: 38,
                        width: 38.0,
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: primaryColor),
                          color: primaryColor[50],
                        ),
                        child: Image.asset(
                            'assets/icons/drawer_icons/my-course-sltd.png'),
                      ),
                      childrenPadding:
                          EdgeInsets.only(left: 60), //children padding
                      children: [
                        ListTile(
                          title: Text("Courses list"),
                          onTap: () { Get.to(() => InsistutionCoursesScreen());},
                        ),

                        ListTile(
                          title: Text("Add Course"),
                          onTap: () {
                            Get.to(() => AddCoursesScreen());
                          },
                        ),

                        //more child menu
                      ],
                    ),
                    ExpansionTile(
                      title: Text(
                        "Instructors",
                        style: TextStyle(fontSize: 16),
                      ),
                      leading: Container(
                        height: 38,
                        width: 38.0,
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: primaryColor),
                          color: primaryColor[50],
                        ),
                        child: Image.asset(
                            'assets/icons/drawer_icons/my-course-sltd.png'),
                      ),
                      childrenPadding:
                          EdgeInsets.only(left: 60), //children padding
                      children: [
                        _drawerMenuItem1('Instructors List', () {
                          Get.to(() => InsistutionInstructorListScreen());

                        }),
                        _drawerMenuItem1('Add Instructors', () {
                          Get.to(() => AddInstructorScreen());
                        }),
                        //more child menu
                      ],
                    ),

                    ExpansionTile(
                      title: Text(
                        "Students",
                        style: TextStyle(fontSize: 16),
                      ),
                      leading: Container(
                        height: 38,
                        width: 38.0,
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: primaryColor),
                          color: primaryColor[50],
                        ),
                        child: Image.asset(
                            'assets/icons/drawer_icons/my-course-sltd.png'),
                      ),
                      childrenPadding:
                          EdgeInsets.only(left: 60), //children padding
                      children: [
                        _drawerMenuItem1('Student List', () {
                          Get.to(() => InsistutionStudentlistScreen());
                        }),
                        _drawerMenuItem1('Add Students', () {
                          Get.to(() => AddStudentScreen());
                        }),
                        //more child menu
                      ],
                    ),
                    Divider(),
                    _drawerMenuItem(
                        Image.asset('assets/icons/drawer_icons/report.png',
                            color: primaryColor),
                        'Privacy Policy',
                        () {}),
                    _drawerMenuItem(
                        Image.asset(
                          'assets/icons/drawer_icons/report.png',
                          color: primaryColor,
                        ),
                        'Terms and Conditions',
                        () {}),
                  ],
                ),
              ),
            ),
            // Spacer(),
            InkWell(
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(0)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.logout,
                              size: 30,
                              color: secondaryColor[50],
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                                child: Text(
                              'Logout',
                              style: TextStyle(
                                  color: secondaryColor[50],
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ))
                          ]),
                    ),
                  ),
                ),
                onTap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: const Text(
                          'Are you sure want to log out?',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        actions: [
                          OutlinedButton(
                            child: const Text('No'),
                            onPressed: () {
                              Navigator.pop(context);

                              Get.back();
                            },
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          ElevatedButton(
                            child: const Text('Yes'),
                            onPressed: () {
                              Navigator.pop(context);
                              SharedPrefs.logOut();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }

  Widget _drawerMenuItem(Widget widget, String title, Function onTap) {
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: Material(
        color: secondaryColor[100],
        child: InkWell(
            child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: .2),
                      borderRadius: BorderRadius.circular(0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(children: [
                      Container(
                        height: 38,
                        width: 38.0,
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: primaryColor),
                          color: primaryColor[50],
                        ),
                        child: widget,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                          child: Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ))
                    ]),
                  ),
                )),
            onTap: () {
              scaffoldKey.currentState!.openEndDrawer();
              onTap();
            }),
      ),
    );
  }

  Widget _drawerMenuItem1(String title, Function onTap) {
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: Material(
        color: secondaryColor[100],
        child: InkWell(
            child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white!, width: .2),
                      borderRadius: BorderRadius.circular(0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Text(
                            title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ))
                        ]),
                  ),
                )),
            onTap: () {
              scaffoldKey.currentState!.openEndDrawer();
              onTap();
            }),
      ),
    );
  }
}
