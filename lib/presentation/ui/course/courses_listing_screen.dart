import 'package:pgs_edupro/application/course/courses_bloc.dart';
import 'package:pgs_edupro/application/payment/payment_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/course/course_in_category_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/course/course_repository.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/payment/payment_repository.dart';
import 'package:pgs_edupro/presentation/ui/course/widgets/courses_listview.dart';
import 'package:pgs_edupro/presentation/widgets/common_result_empty_widget.dart';
import 'package:pgs_edupro/presentation/widgets/common_server_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseListingScreen extends StatelessWidget {
  final String categoryId;
  final String categoryName;
  const CourseListingScreen({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => CoursesBloc(CourseRepository())
              ..add(CoursesEvent.loadCoursesInCatogory(categoryId))),
        BlocProvider(create: (_) => PaymentBloc(PaymentRepository()))
        //..add(PaymentEvent())),
      ],
      child: Scaffold(
        appBar: appBarTheme("$categoryName Courses"),
        body: BlocBuilder<CoursesBloc, CoursesState>(
          builder: (context, state) {
            return state.map(
              initial: (_) => Container(),
              loadInProgress: (_) => SizedBox(
                height: screenHeight,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              loadSuccess: (state) {
                CourseInCategoryResponse res = state.response;
                return res.courseList != null && res.courseList!.isNotEmpty
                    ? CourseListView(
                        courseList: res.courseList!,
                      )
                    : SizedBox(
                        height: screenHeight,
                        width: screenWidth,
                        child: const CommonResultsEmptyWidget());
              },
              loadFailure: (state) {
                return state.networkFailure.map(
                    unexpected: ((value) {
                      return CommonApiErrorWidget(
                          "Unexpected Error \nTry Again", () {
                        context.read<CoursesBloc>().add(
                            CoursesEvent.loadCoursesInCatogory(categoryId));
                      });
                    }),
                    serverError: ((value) {
                      return CommonApiErrorWidget(
                          "Server Error \n${value.errorCode}", () {
                        context.read<CoursesBloc>().add(
                            CoursesEvent.loadCoursesInCatogory(categoryId));
                      });
                    }),
                    nullData: ((value) => SizedBox(
                        height: 200,
                        width: screenWidth,
                        child: const CommonResultsEmptyWidget())),
                    serverTimeOut: (value) {
                      return CommonApiErrorWidget("Server Time Out \nTry Again",
                          () {
                        context.read<CoursesBloc>().add(
                            CoursesEvent.loadCoursesInCatogory(categoryId));
                      });
                    },
                    unAuthorized: (value) =>
                        CommonApiErrorWidget("Server Time Out \nTry Again", () {
                          context.read<CoursesBloc>().add(
                              CoursesEvent.loadCoursesInCatogory(categoryId));
                        }));
              },
              loadMoreInProgress: (LoadMoreInProgress value) => Container(),
            );
          },
        ),
      ),
    );
  }
}
