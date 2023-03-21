import 'package:another_flushbar/flushbar_helper.dart';
import 'package:pgs_edupro/application/my_courses/my_course_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/common_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/my_course/get_answer_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/my_course/get_questions_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/my_course/my_course_repository.dart';
import 'package:pgs_edupro/presentation/ui/my_courses/widgets/answer_widget.dart';
import 'package:pgs_edupro/presentation/widgets/common_server_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnswersScreen extends StatelessWidget {
  final int courseId;
  final QData question;
  AnswersScreen({super.key, required this.courseId, required this.question});
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyCourseBloc(MyCourseRepository())
        ..add(MyCourseEvent.fetchAnswers(courseId, question.questionId!)),
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
                CommonResponse response = res;
                FlushbarHelper.createSuccess(message: response.message ?? '')
                    .show(context);
              },
            );
          },
        );
      }, builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async {
            context.read<MyCourseBloc>().add(
                MyCourseEvent.fetchAnswers(courseId, question.questionId!));
          },
          child: Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: const Text("Answers"),
            ),
            body: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: state.isFetchingData
                  ? SizedBox(
                      height: screenHeight - 180,
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
                                      MyCourseEvent.fetchAnswers(
                                          courseId, question.questionId!));
                                }),
                              ),
                              serverError: (value) => SizedBox(
                                height: screenHeight,
                                child: CommonApiErrorWidget(
                                    'Status Code ${value.errorCode}', () {
                                  context.read<MyCourseBloc>().add(
                                      MyCourseEvent.fetchAnswers(
                                          courseId, question.questionId!));
                                }),
                              ),
                              serverTimeOut: (value) => SizedBox(
                                height: screenHeight,
                                child: CommonApiErrorWidget(
                                    "Server Timed Out \nTry Again", () {
                                  context.read<MyCourseBloc>().add(
                                      MyCourseEvent.fetchAnswers(
                                          courseId, question.questionId!));
                                }),
                              ),
                              unAuthorized: (value) => SizedBox(
                                height: screenHeight,
                                child: CommonApiErrorWidget(value.message, () {
                                  context.read<MyCourseBloc>().add(
                                      MyCourseEvent.fetchAnswers(
                                          courseId, question.questionId!));
                                }),
                              ),
                              nullData: (value) => AnswerWidget(
                                question: question,
                                courseId: courseId,
                                answerList: const [],
                              ),
                            );
                          },
                          (res) {
                            GetAnswerResponse response = res;
                            return AnswerWidget(
                              question: question,
                              courseId: courseId,
                              answerList: response.aData ?? [],
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
