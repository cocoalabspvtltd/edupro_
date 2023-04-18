
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

  const CourtScreen({super.key, this.fromHome = true});

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
                    : Column  (
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Visibility(
                                visible:
                                type == "school"
                                    ? true
                                    : false,
                                child:      Container(
                                  height: 100,
                                  width: screenWidth * 0.44,
                                  child: Card(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        ListTile(
                                          leading: CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "assets/images/home/course.png"), // No matter how big it is, it won't overflow
                                          ),
                                          title: Text('Department'),
                                          subtitle: Text(
                                            '${res.count![0].department.toString()}',
                                            style: TextStyle(
                                                color: Colors.lightBlue,
                                                fontSize: 19),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 100,
                                width: screenWidth * 0.45,
                                child: Card(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      ListTile(
                                        leading: const CircleAvatar(
                                          backgroundImage: AssetImage(
                                              "assets/images/home/course.png"), // No matter how big it is, it won't overflow
                                        ),
                                        title: Text('Code'),
                                        subtitle: Text(
                                          '${UserDetailsLocal.userMobile}',
                                          style: const TextStyle(
                                              color: Colors.lightBlue,
                                              fontSize: 19),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                height: 100,
                                width: screenWidth * 0.45,
                                child: Card(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      ListTile(
                                        leading: const CircleAvatar(
                                          backgroundImage: AssetImage(
                                              "assets/images/home/course.png"), // No matter how big it is, it won't overflow
                                        ),
                                        title: const Text('Courses'),
                                        subtitle: Text(
                                          '${int.parse(res.count![0].courseCount.toString())}',
                                          style: const TextStyle(
                                              color: Colors.lightBlue,
                                              fontSize: 19),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 0.0),
                                child: Container(
                                  height: 100,
                                  width: screenWidth * 0.45,
                                  child: Card(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        ListTile(
                                          leading: const CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "assets/images/home/instructor.png"), // No matter how big it is, it won't overflow
                                          ),
                                          title: const Text('Instructor'),
                                          subtitle: Text(
                                            res.count![0].instructorCount.toString(),
                                            style: const TextStyle(
                                                color: Colors.lightBlue,
                                                fontSize: 19),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                height: 100,
                                width: screenWidth * 0.45,
                                child: Card(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      ListTile(
                                        leading: const CircleAvatar(
                                          backgroundImage: AssetImage(
                                              "assets/images/home/students.png"), // No matter how big it is, it won't overflow
                                        ),
                                        title: Text('Students'),
                                        subtitle: Text(
                                          res.count![0].studentsCount .toString(),
                                          style: const TextStyle(
                                              color: Colors.lightBlue,
                                              fontSize: 19),
                                        ),
                                      ),
                                    ],
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
