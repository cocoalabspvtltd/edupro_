import 'package:animate_gradient/animate_gradient.dart';
import 'package:pgs_edupro/application/Insistution_student_course_instructor/all_categories_bloc.dart';

import 'package:pgs_edupro/domain/core/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgs_edupro/domain/core/failures.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/insistution/insistutionResponse.dart';

import '../../../auth/log_in/widgets/login_form.dart';

class CourtScreen extends StatelessWidget {
  final bool fromHome;

  CourtScreen({super.key, this.fromHome = true});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCategoriesBloc, AllCategoriesState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          loadInProgress: (_) => !fromHome
              ? SizedBox(
                  height: screenHeight,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Container(
                  width: screenWidth,
                  height: 250,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/gif/loaders/course_loader.gif"),
                          fit: BoxFit.cover)),
                ),
          loadSuccess: (state) {
            InsistutionResponse res = state.response;
            return res.count!.isNotEmpty
                ? !fromHome
                    ? Container(
                        color: Colors.red,
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Visibility(
                                visible: type == "school" ? true : false,
                                child: Container(
                                  height: 100,
                                  width: screenWidth * 0.45,
                                  child: AnimateGradient(
                                    primaryBegin: Alignment.topLeft,
                                    primaryEnd: Alignment.bottomLeft,
                                    secondaryBegin: Alignment.bottomLeft,
                                    secondaryEnd: Alignment.topRight,
                                    primaryColors: const [
                                      Colors.orange,
                                      Colors.orangeAccent,
                                      Colors.white,
                                    ],
                                    secondaryColors: const [
                                      Colors.white,
                                      Colors.purpleAccent,
                                      Colors.purple,
                                    ],
                                    child: const Center(
                                      child: Text(
                                        'Animated Gradient',
                                        style: TextStyle(
                                          fontSize: 36,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: type == "institution" ? true : false,
                                child: Container(
                                  height: 100,
                                  width: screenWidth * 0.45,
                                  child: AnimateGradient(
                                    primaryBegin: Alignment.topLeft,
                                    primaryEnd: Alignment.bottomLeft,
                                    secondaryBegin: Alignment.bottomLeft,
                                    secondaryEnd: Alignment.topRight,
                                    primaryColors: const [
                                      Colors.orange,
                                      Colors.orangeAccent,
                                      Colors.white,
                                    ],
                                    secondaryColors: const [
                                      Colors.white,
                                      Colors.purpleAccent,
                                      Colors.purple,
                                    ],
                                    child: Center(
                                        child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 18.0),
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "assets/images/home/institute.jpg"), // No matter how big it is, it won't overflow
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Center(
                                                child: Text(
                                              'Code',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: "Pacifico",
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            )),
                                            Text(
                                              UserDetailsLocal.userMobile,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: "Pacifico",
                                                  color: Colors.orange,
                                                  fontSize: 18),
                                            ),
                                          ],
                                        )
                                      ],
                                    )),
                                  ),
                                  //
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                height: 100,
                                width: screenWidth * 0.45,
                                child: AnimateGradient(
                                  primaryBegin: Alignment.topLeft,
                                  primaryEnd: Alignment.bottomLeft,
                                  secondaryBegin: Alignment.bottomLeft,
                                  secondaryEnd: Alignment.topRight,
                                  primaryColors: const [
                                    Colors.orange,
                                    Colors.orangeAccent,
                                    Colors.white,
                                  ],
                                  secondaryColors: const [
                                    Colors.white,
                                    Colors.purpleAccent,
                                    Colors.purple,
                                  ],
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 18.0),
                                          child:  CircleAvatar(
                                              backgroundImage: AssetImage(
                                                   "assets/images/home/course.png"), // No matter how big it is, it won't overflow
                                                      ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Center(
                                                child: Text(
                                              'Courses',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: "Pacifico",
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            )),
                                                   Text(
                                             '${int.parse(res.count![0].courseCount.toString())}',
                                              style: TextStyle(
                                               color: Colors.orange,
                                                  fontSize: 19),
            ),
                                          ],
                                        )
                                      ],
                                    ),

                                  ),
                                ),
                              ),
                            ],
                          ),
                        SizedBox(height: 15,),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 0.0),
                                child: Container(
                                  height: 100,
                                  width: screenWidth * 0.45,
                                  child: AnimateGradient(
                                    primaryBegin: Alignment.topLeft,
                                    primaryEnd: Alignment.bottomLeft,
                                    secondaryBegin: Alignment.bottomLeft,
                                    secondaryEnd: Alignment.topRight,
                                    primaryColors: const [
                                      Colors.orange,
                                      Colors.orangeAccent,
                                      Colors.white,
                                    ],
                                    secondaryColors: const [
                                      Colors.white,
                                      Colors.purpleAccent,
                                      Colors.purple,
                                    ],
                                    child: Center(
                                      child:Row(
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(left: 18.0),
                                            child:  CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  "assets/images/home/instructor.png"), // No matter how big it is, it won't overflow
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Center(
                                                  child: Text(
                                                    'Instructor',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.normal,
                                                        fontFamily: "Pacifico",
                                                        color: Colors.white,
                                                        fontSize: 18),
                                                  )),
                                              Text(
                                                '${res.count![0].instructorCount.toString()}',
                                                style: TextStyle(
                                                    color: Colors.orange,
                                                    fontSize: 19),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),


                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                height: 100,
                                width: screenWidth * 0.45,
                                child: AnimateGradient(
                                  primaryBegin: Alignment.topLeft,
                                  primaryEnd: Alignment.bottomLeft,
                                  secondaryBegin: Alignment.bottomLeft,
                                  secondaryEnd: Alignment.topRight,
                                  primaryColors: const [
                                    Colors.orange,
                                    Colors.orangeAccent,
                                    Colors.white,
                                  ],
                                  secondaryColors: const [
                                    Colors.white,
                                    Colors.purpleAccent,
                                    Colors.purple,
                                  ],
                                  child: Center(
                                    child:
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(left: 18.0),
                                          child:  CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "assets/images/home/students.png"), // No matter how big it is, it won't overflow
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            const Center(
                                                child: Text(
                                                  'Students',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.normal,
                                                      fontFamily: "Pacifico",
                                                      color: Colors.white,
                                                      fontSize: 18),
                                                )),
                                            Text(
                                              res.count![0].studentsCount.toString(),
                                              style: const TextStyle(
                                                  color: Colors.orange,
                                                  fontSize: 19),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),

                                  ),
                                ),
                              ),
                            ],
                          ),
                          //VideoVerticalListView(videoList: res.video!),
                        ],
                      )
                : Container();
            // SizedBox(
            //     height: !fromHome ? screenHeight : 300,
            //     width: screenWidth,
            //     child: const CommonResultsEmptyWidget());
          },
          loadFailure: (state) {
            return Container();
          },
          loadMoreInProgress: (LoadMoreInProgress value) => Container(),
        );
      },
    );
  }
}
