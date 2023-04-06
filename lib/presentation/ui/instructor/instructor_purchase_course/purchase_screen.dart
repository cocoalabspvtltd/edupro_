import 'package:pgs_edupro/application/course/courses_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/my_course/my_courses_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/course/course_repository.dart';
import 'package:pgs_edupro/presentation/ui/course/widgets/my_course.dart';
import 'package:pgs_edupro/presentation/widgets/common_result_empty_widget.dart';
import 'package:pgs_edupro/presentation/widgets/common_server_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PurchasedCoursesScreen extends StatelessWidget {
  final bool fromHome;
  const PurchasedCoursesScreen({super.key, this.fromHome = true});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CoursesBloc(CourseRepository())
        ..add(const CoursesEvent.loadPurchaseCourses()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Purchases Courses",
            style: boldValuePrimaryColor,
          ),
        ),
        body: BlocBuilder<CoursesBloc, CoursesState>(
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () async {
                return context
                    .read<CoursesBloc>()
                    .add(const CoursesEvent.loadPurchaseCourses());
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
                      MyCoursesResponse res = state.response;
                      return res.myCourseData != null ||
                          res.myCourseData!.isNotEmpty
                          ? InstructorPurcahsedCourseListView(course: res.myCourseData!,)
                          : SizedBox(
                          height: screenHeight -
                              180, //!fromHome ? screenHeight : 300,
                          width: screenWidth,
                          child: const CommonResultsEmptyWidget());
                    },
                    loadFailure: (state) {
                      return state.networkFailure.map(
                          unexpected: ((value) {
                            return SizedBox(
                              height: screenHeight - 180,
                              child: CommonApiErrorWidget(
                                  "Unexpected Error \nTry Again", () {
                                context
                                    .read<CoursesBloc>()
                                    .add(const CoursesEvent.loadPurchaseCourses());
                              }),
                            );
                          }),
                          serverError: ((value) {
                            return SizedBox(
                              height: screenHeight - 180,
                              child: CommonApiErrorWidget(
                                  "Server Error \n${value.errorCode}", () {
                                context
                                    .read<CoursesBloc>()
                                    .add(const CoursesEvent.loadPurchaseCourses());
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
                                    .read<CoursesBloc>()
                                    .add(const CoursesEvent.loadPurchaseCourses());
                              }),
                            );
                          },
                          unAuthorized: (value) => SizedBox(
                            height: screenHeight - 180,
                            child: CommonApiErrorWidget(value.message, () {
                              context
                                  .read<CoursesBloc>()
                                  .add(const CoursesEvent.loadPurchaseCourses());
                            }),
                          ));
                    },
                    loadMoreInProgress: (LoadMoreInProgress value) =>
                        Container(),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
