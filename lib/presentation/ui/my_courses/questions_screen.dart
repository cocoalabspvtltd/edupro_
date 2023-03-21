import 'package:another_flushbar/flushbar_helper.dart';
import 'package:pgs_edupro/application/my_courses/my_course_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/my_course/get_questions_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/my_course/my_course_repository.dart';
import 'package:pgs_edupro/presentation/ui/my_courses/widgets/question_widget.dart';
import 'package:pgs_edupro/presentation/widgets/app_dialogs.dart';
import 'package:pgs_edupro/presentation/widgets/common_result_empty_widget.dart';
import 'package:pgs_edupro/presentation/widgets/common_server_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionsScreen extends StatelessWidget {
  final int courseId;
  QuestionsScreen({super.key, required this.courseId});
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyCourseBloc(MyCourseRepository())
        ..add(MyCourseEvent.fetchQuestions(courseId)),
      child:
          BlocConsumer<MyCourseBloc, MyCourseState>(listener: (context, state) {
        state.submitFailureOrSuccessOption.fold(
          () {},
          (either) {
            either.fold(
              (failure) {
                FlushbarHelper.createError(
                  message: failure.map(
                    unexpected: (value) => 'Unexpected Error',
                    serverError: (value) => 'Server Error',
                    serverTimeOut: (value) => 'Server Timed Out',
                    unAuthorized: (value) => value.message,
                    nullData: (value) => 'Data Not Found',
                  ),
                ).show(context);
              },
              (res) {
                FlushbarHelper.createSuccess(message: res.message)
                    .show(context);
              },
            );
          },
        );
      }, builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: const Text("Q&A"),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: _scaffoldKey.currentContext!,
                builder: (BuildContext context) {
                  return AlertDialog(
                    insetPadding: const EdgeInsets.all(8),
                    title: const Text("Ask Question"),
                    content: SizedBox(
                      width: screenWidth,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TextField(
                              maxLines: null,
                              decoration: const InputDecoration(
                                hintText: 'Title',
                                labelText: 'Title',
                              ),
                              onChanged: (v) => _scaffoldKey.currentContext!
                                  .read<MyCourseBloc>()
                                  .add(MyCourseEvent.enterQuestionTitle(v)),
                            ),
                            thickSpace,
                            thickSpace,
                            TextField(
                              maxLines: null,
                              decoration: const InputDecoration(
                                hintText: 'Details',
                                labelText: 'Details',
                              ),
                              onChanged: (v) => _scaffoldKey.currentContext!
                                  .read<MyCourseBloc>()
                                  .add(MyCourseEvent.enterQuestionSubject(v)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    actions: <Widget>[
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel"),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          AppDialogs.loading();
                          _scaffoldKey.currentContext!.read<MyCourseBloc>().add(
                              MyCourseEvent.askQuestions(courseId,
                                  int.parse(UserDetailsLocal.userId)));
                          await Future.delayed(const Duration(seconds: 1));
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);
                          // ignore: use_build_context_synchronously
                          _scaffoldKey.currentContext!
                              .read<MyCourseBloc>()
                              .add(MyCourseEvent.fetchQuestions(courseId));
                        },
                        child: const Text("Post"),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Icon(Icons.add),
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              context
                  .read<MyCourseBloc>()
                  .add(MyCourseEvent.fetchQuestions(courseId));
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
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
                                      MyCourseEvent.fetchQuestions(courseId));
                                }),
                              ),
                              serverError: (value) => SizedBox(
                                height: screenHeight,
                                child: CommonApiErrorWidget(
                                    'Status Code ${value.errorCode}', () {
                                  context.read<MyCourseBloc>().add(
                                      MyCourseEvent.fetchQuestions(courseId));
                                }),
                              ),
                              serverTimeOut: (value) => SizedBox(
                                height: screenHeight,
                                child: CommonApiErrorWidget(
                                    "Server Timed Out \nTry Again", () {
                                  context.read<MyCourseBloc>().add(
                                      MyCourseEvent.fetchQuestions(courseId));
                                }),
                              ),
                              unAuthorized: (value) => SizedBox(
                                height: screenHeight,
                                child: CommonApiErrorWidget(value.message, () {
                                  context.read<MyCourseBloc>().add(
                                      MyCourseEvent.fetchQuestions(courseId));
                                }),
                              ),
                              nullData: (value) => SizedBox(
                                  height: screenHeight,
                                  child: const CommonResultsEmptyWidget()),
                            );
                          },
                          (res) {
                            GetQuestionsResponse response = res;
                            return response.qData?.isEmpty ?? false
                                ? SizedBox(
                                    height: screenHeight,
                                    child: const CommonResultsEmptyWidget())
                                : QuestionWidget(
                                    qData: response.qData!,
                                    courseId: courseId,
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
