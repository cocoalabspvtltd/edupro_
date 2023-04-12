import 'package:pgs_edupro/application/insistution_count/insistution_bloc.dart';

import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/insistution/count.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/video/video_response.dart';
import 'package:pgs_edupro/presentation/ui/videos/video_screen.dart';
import 'package:pgs_edupro/presentation/ui/videos/widgets/video_vertical_list_widget.dart';
import 'package:pgs_edupro/presentation/ui/videos/widgets/videos_grid_widget.dart';
import 'package:pgs_edupro/presentation/widgets/common_server_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgs_edupro/presentation/widgets/common_result_empty_widget.dart';
import 'package:get/get.dart';

class CourtScreen extends StatelessWidget {
  final bool fromHome;

  CourtScreen({super.key, this.fromHome = true});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InsistutionBloc, InsistutionState>(
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
            CountResponse res = state.response;
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
                                          leading: CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "assets/images/home/institute.jpg"), // No matter how big it is, it won't overflow
                                          ),
                                          title: Text('Code'),
                                          subtitle: SizedBox(
                                              child: Text(
                                            'Cd',
                                            style: TextStyle(
                                                color: Colors.lightBlue,
                                                fontSize: 19),
                                          )),
                                        ),
                                      ],
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
                                child: Card(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      ListTile(
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              "assets/images/home/course.png"), // No matter how big it is, it won't overflow
                                        ),
                                        title: Text('Courses'),
                                        subtitle: Text(
                                          '${res.courseCount}',
                                          style: TextStyle(
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
                                          leading: CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "assets/images/home/instructor.png"), // No matter how big it is, it won't overflow
                                          ),
                                          title: Text('Instructor'),
                                          subtitle: Text(
                                            '${res.instructorCount}',
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
                              SizedBox(
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
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              "assets/images/home/students.png"), // No matter how big it is, it won't overflow
                                        ),
                                        title: Text('Students'),
                                        subtitle: Text(
                                          '${res.userCount}',
                                          style: TextStyle(
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
