import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_field/date_field.dart';
import 'package:pgs_edupro/application/course/courses_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/course/course_report_response.dart';
import 'package:pgs_edupro/presentation/widgets/common_result_empty_widget.dart';
import 'package:pgs_edupro/presentation/widgets/common_server_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CourseReportWidget extends StatefulWidget {
  const CourseReportWidget({
    super.key,
  });

  @override
  State<CourseReportWidget> createState() => _CourseReportWidgetState();
}

class _CourseReportWidgetState extends State<CourseReportWidget> {
  String? fromDate;
  String? toDate;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursesBloc, CoursesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text("Report")),
          body: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("From Date"),
                        SizedBox(
                          width: screenWidth / 2 - 25,
                          child: DateTimeFormField(
                              dateTextStyle: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                              dateFormat: DateFormat.yMd(),
                              decoration: InputDecoration(
                                //filled: true,
                                fillColor: primaryColor[100],

                                prefixIconConstraints: const BoxConstraints(
                                  maxHeight: 30,
                                  minHeight: 30,
                                  maxWidth: 50,
                                  minWidth: 50,
                                ),
                                hintStyle: TextStyle(color: primaryColor[200]),
                                border: const OutlineInputBorder(),
                                suffixIcon: const Icon(Icons.event_note),
                              ),
                              mode: DateTimeFieldPickerMode.date,
                              //firstDate: DateTime.now().add(const Duration(days: 10)),
                              lastDate:
                                  DateTime.now().add(const Duration(days: 40)),
                              // initialDate:
                              //     DateTime.now().add(const Duration(days: 20)),
                              autovalidateMode: AutovalidateMode.always,
                              onDateSelected: (DateTime value) {
                                fromDate = value.toString().split(' ').first;
                                setState(() {});
                              }),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("To Date"),
                        SizedBox(
                          width: screenWidth / 2 - 25,
                          child: DateTimeFormField(
                              dateTextStyle: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                              dateFormat: DateFormat.yMd(),
                              decoration: InputDecoration(
                                //filled: true,
                                fillColor: primaryColor[100],

                                prefixIconConstraints: const BoxConstraints(
                                  maxHeight: 30,
                                  minHeight: 30,
                                  maxWidth: 50,
                                  minWidth: 50,
                                ),
                                hintStyle: TextStyle(color: primaryColor[200]),
                                border: const OutlineInputBorder(),
                                suffixIcon: const Icon(Icons.event_note),
                              ),
                              mode: DateTimeFieldPickerMode.date,
                              //firstDate: DateTime.now().add(const Duration(days: 10)),
                              lastDate:
                                  DateTime.now().add(const Duration(days: 40)),
                              // initialDate:
                              //     DateTime.now().add(const Duration(days: 20)),
                              autovalidateMode: AutovalidateMode.always,
                              onDateSelected: (DateTime value) {
                                toDate = value.toString().split(' ').first;
                                setState(() {});
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
                thickSpace,
                SizedBox(
                  height: 50,
                  width: screenWidth - 40,
                  child: ElevatedButton(
                    onPressed: (fromDate == null || toDate == null)
                        ? null
                        : () => context.read<CoursesBloc>().add(
                            CoursesEvent.loadCourseReport(fromDate!, toDate!)),
                    style: ElevatedButton.styleFrom(
                        elevation: 4, disabledBackgroundColor: Colors.grey),
                    child: const Text('Fetch Report'),
                  ),
                ),
                state.map(
                  initial: (_) => Container(),
                  loadInProgress: (_) => const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  loadSuccess: (res) {
                    //   var myCourseList = res.response;
                    MyCourseReportResponse myCourseReport = res.response;
                    return myCourseReport.reportList != null ||
                            myCourseReport.reportList!.isNotEmpty
                        ? Expanded(
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: myCourseReport.reportList?.length,
                                itemBuilder:
                                    (BuildContext context, int position) {
                                  return ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: myCourseReport
                                        .reportList?[position].length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return InkWell(
                                        onTap: () {
                                          // Get.to(() => MyCourseDetailsScreen(
                                          //       courseDetails:
                                          //           myCourseReport.reportList?[position]
                                          //               [index],
                                          //     ));
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.all(8),
                                          padding: const EdgeInsets.all(4),
                                          color: Colors.grey[200],
                                          height: 96,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 80,
                                                height: 80,
                                                margin: const EdgeInsets.all(8),
                                                decoration: const BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(6)),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  child: CachedNetworkImage(
                                                    fit: BoxFit.cover,
                                                    imageUrl: UserDetailsLocal
                                                            .storageBaseUrl +
                                                        (myCourseReport
                                                                .reportList?[
                                                                    position]
                                                                    [index]
                                                                .courseThumbnail ??
                                                            ''),
                                                    imageBuilder: (context,
                                                            imageProvider) =>
                                                        Container(
                                                            decoration: BoxDecoration(
                                                                image: DecorationImage(
                                                                    image:
                                                                        imageProvider,
                                                                    fit: BoxFit
                                                                        .cover))),
                                                    placeholder:
                                                        (context, url) =>
                                                            const Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            const Image(
                                                      image: AssetImage(
                                                          'assets/images/video_thumpnail_error.png'),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              thickSpace,
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5, bottom: 5),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: screenWidth - 120,
                                                      child: Text(
                                                        myCourseReport
                                                                .reportList?[
                                                                    position]
                                                                    [index]
                                                                .title ??
                                                            "",
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                primaryColor),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "Instructor Name",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: smallText,
                                                    ),
                                                    Text(
                                                      "Duration: ${myCourseReport.reportList?[position][index].duration ?? ''}",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: smallText,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }),
                          )
                        : const Expanded(child: CommonResultsEmptyWidget());
                  },
                  loadFailure: (state) {
                    return state.networkFailure.map(
                        unexpected: ((value) {
                          return CommonApiErrorWidget(
                              "Unexpected Error \nTry Again", () {
                            context.read<CoursesBloc>().add(
                                CoursesEvent.loadCourseReport(
                                    fromDate!, toDate!));
                          });
                        }),
                        serverError: ((value) {
                          return CommonApiErrorWidget(
                              "Server Error \n${value.errorCode}", () {
                            context.read<CoursesBloc>().add(
                                CoursesEvent.loadCourseReport(
                                    fromDate!, toDate!));
                          });
                        }),
                        nullData: ((value) =>
                            const Expanded(child: CommonResultsEmptyWidget())),
                        serverTimeOut: (value) {
                          return CommonApiErrorWidget(
                              "Server Time Out \nTry Again", () {
                            context.read<CoursesBloc>().add(
                                CoursesEvent.loadCourseReport(
                                    fromDate!, toDate!));
                          });
                        },
                        unAuthorized: (value) => CommonApiErrorWidget(
                                "Server Time Out \nTry Again", () {
                              context.read<CoursesBloc>().add(
                                  CoursesEvent.loadCourseReport(
                                      fromDate!, toDate!));
                            }));
                  },
                  loadMoreInProgress: (LoadMoreInProgress value) => Container(),
                )
                // ListView.builder(
                //   shrinkWrap: true,
                //   scrollDirection: Axis.vertical,
                //   itemCount: 1,
                //   itemBuilder: (BuildContext context, int index) {
                //     return Container();
                //   },
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
