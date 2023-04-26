import 'package:pgs_edupro/application/course/courses_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/my_course/my_courses_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/course/course_repository.dart';
import 'package:pgs_edupro/presentation/ui/course/widgets/my_course.dart';
import 'package:pgs_edupro/presentation/widgets/common_result_empty_widget.dart';
import 'package:pgs_edupro/presentation/widgets/common_server_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCourseScreen extends StatelessWidget {
  final bool fromHome;
  const MyCourseScreen({super.key, this.fromHome = true});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CoursesBloc(CourseRepository())
        ..add(const CoursesEvent.loadMyCourses()),
      child: Scaffold(
        body: BlocBuilder<CoursesBloc, CoursesState>(
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () async {
                return context
                    .read<CoursesBloc>()
                    .add(const CoursesEvent.loadMyCourses());
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
                      return res.myCourseData == null
                          ? SizedBox(
                          height: screenHeight -
                              180,
                          width: screenWidth,
                          child: const CommonResultsEmptyWidget()) :MyCourseListView(myCourseData: res.myCourseData!);
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
                                    .add(const CoursesEvent.loadMyCourses());
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
                                    .add(const CoursesEvent.loadMyCourses());
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
                                    .add(const CoursesEvent.loadMyCourses());
                              }),
                            );
                          },
                          unAuthorized: (value) => SizedBox(
                                height: screenHeight - 180,
                                child: CommonApiErrorWidget(value.message, () {
                                  context
                                      .read<CoursesBloc>()
                                      .add(const CoursesEvent.loadMyCourses());
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
