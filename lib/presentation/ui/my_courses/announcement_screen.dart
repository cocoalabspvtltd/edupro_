import 'package:pgs_edupro/application/my_courses/my_course_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/my_course/announcements_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/my_course/my_course_repository.dart';
import 'package:pgs_edupro/presentation/ui/my_courses/widgets/announcement_widget.dart';
import 'package:pgs_edupro/presentation/widgets/common_result_empty_widget.dart';
import 'package:pgs_edupro/presentation/widgets/common_server_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnnouncementScreen extends StatelessWidget {
  final int courseId;
  const AnnouncementScreen({super.key, required this.courseId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyCourseBloc(MyCourseRepository())
        ..add(MyCourseEvent.fetchAnnouncements(courseId)),
      child:
          BlocBuilder<MyCourseBloc, MyCourseState>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Announcements"),
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              context
                  .read<MyCourseBloc>()
                  .add(MyCourseEvent.fetchAnnouncements(courseId));
            },
            child: SingleChildScrollView(
              child: state.isFetchingData
                  ? SizedBox(
                      height: screenHeight,
                      child: const Center(child: CircularProgressIndicator()),
                    )
                  : state.loadFailureOrSuccessOption.fold(
                      () => Container(),
                      (either) {
                        return either.fold(
                          (failure) {
                            return failure.map(
                              unexpected: (value) => SizedBox(
                                height: screenHeight,
                                child: CommonApiErrorWidget(
                                    "Unexpected Error \nTry Again", () {
                                  context.read<MyCourseBloc>().add(
                                      MyCourseEvent.fetchAnnouncements(
                                          courseId));
                                }),
                              ),
                              serverError: (value) => SizedBox(
                                height: screenHeight,
                                child: CommonApiErrorWidget(
                                    'Status Code ${value.errorCode}', () {
                                  context.read<MyCourseBloc>().add(
                                      MyCourseEvent.fetchAnnouncements(
                                          courseId));
                                }),
                              ),
                              serverTimeOut: (value) => SizedBox(
                                height: screenHeight,
                                child: CommonApiErrorWidget(
                                    "Server Timed Out \nTry Again", () {
                                  context.read<MyCourseBloc>().add(
                                      MyCourseEvent.fetchAnnouncements(
                                          courseId));
                                }),
                              ),
                              unAuthorized: (value) => SizedBox(
                                height: screenHeight,
                                child: CommonApiErrorWidget(value.message, () {
                                  context.read<MyCourseBloc>().add(
                                      MyCourseEvent.fetchAnnouncements(
                                          courseId));
                                }),
                              ),
                              nullData: (value) => SizedBox(
                                  height: screenHeight,
                                  child: const CommonResultsEmptyWidget()),
                            );
                          },
                          (res) {
                            AnnouncementsResponse response = res;
                            return AnnouncementWidget(
                              courseAnnouncementsList:
                                  response.courseAnnouncementData!,
                            );
                          },
                        );
                      },
                    ),
            ),
          ),
        );
      }),
    );
  }
}
