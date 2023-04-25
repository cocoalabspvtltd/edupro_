
import 'package:get/get.dart';
import 'package:pgs_edupro/application/Insistution_student_course_instructor/all_categories_bloc.dart';
import 'package:pgs_edupro/application/institution_deletion_course/course_deletion_bloc.dart';

import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/insistution/insistutionResponse.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/course/course_repository.dart';
import 'package:pgs_edupro/presentation/ui/institution/courses_of_insisitution/widgets/view_course_details.dart';
import 'package:pgs_edupro/presentation/widgets/common_result_empty_widget.dart';
import 'package:pgs_edupro/presentation/widgets/common_server_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
String course_id ='';
class InsistutionCoursesScreen extends StatelessWidget {
  final bool fromHome;
  const InsistutionCoursesScreen({super.key, this.fromHome = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Courses",
          style: boldValuePrimaryColor,
        ),
      ),
      body: MultiBlocProvider(
  providers: [
    BlocProvider(
        create: (_) => AllCategoriesBloc(CourseRepository())
          ..add(const AllCategoriesEvent.loadMyCourses()),
),
    BlocProvider(
      create: (_) => CourseDeletionBloc(CourseRepository())
        ..add( CourseDeletionEvent.saveAndUpdatePressed()),
    ),
  ],
  child: Scaffold(
          body: BlocBuilder<AllCategoriesBloc, AllCategoriesState>(
            builder: (context, state) {
              return RefreshIndicator(
                onRefresh: () async {
                  return context
                      .read<AllCategoriesBloc>()
                      .add(const AllCategoriesEvent.loadMyCourses());
                },
                child: SizedBox(
                  height: screenHeight,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: state.map(
                      initial: (_) => Container(),
                      loadInProgress: (_) => SizedBox(
                        height: screenHeight - 180,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      loadSuccess: (state) {
                        InsistutionResponse res = state.response;
                        return res.course!.isEmpty
                            ?  SizedBox(
                            height: screenHeight -
                                180, //!fromHome ? screenHeight : 300,
                            width: screenWidth,
                            child: const CommonResultsEmptyWidget())
                       : Column(
                          children: [
                            const SizedBox(
                              height: 25,
                            ),
                            ListView.separated(
                              separatorBuilder: (BuildContext context, int index) {
                                return const SizedBox(
                                  height: 4,
                                );
                              },
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: res.course!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                    elevation: 1,
                                    color: Colors.white,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(7))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                                      child: ListTile(
                                        // selected: selectedIndex == index ? true : false,
                                        isThreeLine: true,
                                        title: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('${res.course![index].title} ',
                                                style: TextStyle(fontSize: 18,
                                                    color:
                                                    Colors.black
                                                )),
                                            const SizedBox(height: 5,),
                                          ],
                                        ),
                                        subtitle: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${res.course![index].category} ',
                                              style: TextStyle(
                                                fontSize: 18, color: Colors.black,),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                CircleAvatar(
                                                  radius: 16,
                                                  backgroundColor:Colors.pink[300],
                                                  child: IconButton(
                                                    onPressed: () {
                                                    },
                                                    icon: const Icon(Icons.edit,
                                                      color: Colors.white, size: 15,),
                                                  ),
                                                ),
                                                const SizedBox(width: 7,),
                                                CircleAvatar(
                                                  radius: 16,
                                                  backgroundColor: Colors.blueAccent,
                                                  child: IconButton(
                                                    onPressed: () {
                                                      Get.to(() => ViewCourseDetailsScreen(
                                                          coursedetails:res.course![index]
                                                      ));
                                                    },
                                                    icon: const Icon(Icons.remove_red_eye,
                                                      color: Colors.white, size: 15,),
                                                  ),
                                                ),
                                                const SizedBox(width: 7,),
                                                CircleAvatar(
                                                  radius: 16,
                                                  backgroundColor: Colors.red,
                                                  child: IconButton(
                                                    onPressed: () {
                                                      course_id= res.course![index].id!.toString();
                                                      context
                                                          .read<
                                                          CourseDeletionBloc>()
                                                          .add(
                                                          CourseDeletionEvent
                                                              .saveAndUpdatePressed(
                                                          ));
                                                    },
                                                    icon: const Icon(Icons.delete,
                                                      color: Colors.white, size: 15,),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),));
                              },
                            ),
                          ],
                        );

                      },
                      loadFailure: (state) {
                        return state.networkFailure.map(
                            unexpected: ((value) {
                              return SizedBox(
                                height: screenHeight - 180,
                                child: CommonApiErrorWidget(
                                    "Unexpected Error \nTry Again", () {
                                  context
                                      .read<AllCategoriesBloc>()
                                      .add(const AllCategoriesEvent.loadMyCourses());
                                }),
                              );
                            }),
                            serverError: ((value) {
                              return SizedBox(
                                height: screenHeight - 180,
                                child: CommonApiErrorWidget(
                                    "Server Error \n${value.errorCode}", () {
                                  context
                                      .read<AllCategoriesBloc>()
                                      .add(const AllCategoriesEvent.loadMyCourses());
                                }),
                              );
                            }),
                            nullData: ((value) => SizedBox(
                                height:
                                screenHeight, //!fromHome ? screenHeight : 200,
                                width: screenWidth,
                                child: const CommonResultsEmptyWidget())),
                            serverTimeOut: (value) {
                              return SizedBox(
                                height: screenHeight - 180,
                                child: CommonApiErrorWidget(
                                    "Server Time Out \nTry Again", () {
                                  context
                                      .read<AllCategoriesBloc>()
                                      .add(const AllCategoriesEvent.loadMyCourses());
                                }),
                              );
                            },
                            unAuthorized: (value) => SizedBox(
                              height: screenHeight - 180,
                              child: CommonApiErrorWidget(value.message, () {
                                context
                                    .read<AllCategoriesBloc>()
                                    .add( AllCategoriesEvent.loadMyCourses());
                              }),
                            ));
                      },
                      loadMoreInProgress: (LoadMoreInProgress value) =>
                          Container(height:40,width:50,color: Colors.grey,),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
),
    );
  }
}
