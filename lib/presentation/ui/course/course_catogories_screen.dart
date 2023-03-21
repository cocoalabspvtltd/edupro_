import 'package:pgs_edupro/application/course/courses_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/course/course_categories_response.dart';
import 'package:pgs_edupro/presentation/ui/course/widgets/course_categories_listview.dart';
import 'package:pgs_edupro/presentation/ui/course/widgets/course_category_grid.dart';
import 'package:pgs_edupro/presentation/widgets/common_result_empty_widget.dart';
import 'package:pgs_edupro/presentation/widgets/common_server_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'all_course_category_screen.dart';

class CourseCategoriesScreen extends StatelessWidget {
  final bool fromHome;
  const CourseCategoriesScreen({super.key, this.fromHome = true});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursesBloc, CoursesState>(
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
                              "assets/gif/loaders/category_loader.gif"),
                          fit: BoxFit.cover)),
                ),
          loadSuccess: (state) {
            CourseCategoriesResponse res = state.response;
            return res.categoryList!.isNotEmpty
                ? !fromHome
                    ? CourseCategoriesGridView(
                        categoryList: res.categoryList!,
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                " Course Categories ",
                                style: boldWord,
                              ),
                              TextButton(
                                onPressed: () =>
                                    Get.to(() => const SeeAllCourseCategory()),
                                style: TextButton.styleFrom(
                                    padding: const EdgeInsets.all(0)),
                                child: Text(
                                  "See All",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor[200],
                                  ),
                                ),
                              )
                            ],
                          ),
                          CourseCategoriesListView(
                            categoryList: res.categoryList!,
                          ),
                        ],
                      )
                : Container();
            // SizedBox(
            //     height: !fromHome ? screenHeight : 300,
            //     width: screenWidth,
            //     child: const CommonResultsEmptyWidget());
          },
          loadFailure: (state) {
            return state.networkFailure.map(
                unexpected: ((value) {
                  return CommonApiErrorWidget("Unexpected Error \nTry Again",
                      () {
                    context
                        .read<CoursesBloc>()
                        .add(const CoursesEvent.loadCourseCategories());
                  });
                }),
                serverError: ((value) {
                  return CommonApiErrorWidget(
                      "Server Error \n${value.errorCode}", () {
                    context
                        .read<CoursesBloc>()
                        .add(const CoursesEvent.loadCourseCategories());
                  });
                }),
                nullData: ((value) => SizedBox(
                    height: !fromHome ? screenHeight : 200,
                    width: screenWidth,
                    child: const CommonResultsEmptyWidget())),
                serverTimeOut: (value) {
                  return CommonApiErrorWidget("Server Time Out \nTry Again",
                      () {
                    context
                        .read<CoursesBloc>()
                        .add(const CoursesEvent.loadCourseCategories());
                  });
                },
                unAuthorized: (value) =>
                    CommonApiErrorWidget("Server Time Out \nTry Again", () {
                      context
                          .read<CoursesBloc>()
                          .add(const CoursesEvent.loadCourseCategories());
                    }));
          },
          loadMoreInProgress: (LoadMoreInProgress value) => Container(),
        );
      },
    );
  }
}
