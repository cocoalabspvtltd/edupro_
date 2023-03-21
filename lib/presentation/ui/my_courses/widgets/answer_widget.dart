import 'package:cached_network_image/cached_network_image.dart';
import 'package:pgs_edupro/application/my_courses/my_course_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/my_course/get_answer_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/my_course/get_questions_response.dart';
import 'package:pgs_edupro/presentation/widgets/common_result_empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnswerWidget extends StatefulWidget {
  final List<AData> answerList;
  final QData question;
  final int courseId;
  const AnswerWidget({
    Key? key,
    required this.question,
    required this.courseId,
    required this.answerList,
  }) : super(key: key);

  @override
  State<AnswerWidget> createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  final TextEditingController _ans = TextEditingController();
  late String timeDifference;
  @override
  void initState() {
    timeDifference = DateTime.now()
                .difference(DateTime.parse(widget.question.datePosted ?? ''))
                .inHours >
            48
        ? '${DateTime.now().difference(DateTime.parse(widget.question.datePosted ?? '')).inDays} days ago'
        : '${DateTime.now().difference(DateTime.parse(widget.question.datePosted ?? '')).inHours} hours ago';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyCourseBloc, MyCourseState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: UserDetailsLocal.storageBaseUrl +
                        (widget.question.userPosted?.displayPicture ?? ''),
                    placeholder: (context, url) => Container(
                      width: screenWidth * .12,
                      height: screenWidth * .12,
                      padding: const EdgeInsets.all(10),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    imageBuilder: (context, imageProvider) => Container(
                      width: screenWidth * .12,
                      height: screenWidth * .12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      width: screenWidth * .12,
                      height: screenWidth * .12,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/icons/drawer_icons/display-picture-sltd.png'),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.question.userPosted?.name ?? '',
                        style: boldWord,
                      ),
                      Text(
                        '$timeDifference, ${widget.question.timePosted}',
                        style: smallText,
                      )
                    ],
                  )
                ],
              ),
              thickSpace,
              Text(
                widget.question.questionTitle ?? '',
                style: boldValue,
              ),
              thickSpace,
              Text(
                widget.question.questionSubject ?? '',
                style: smallText,
              ),
              Divider(
                color: primaryColor[100],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      textInputAction: TextInputAction.done,
                      controller: _ans,
                      maxLines: null,
                      onChanged: (v) => context
                          .read<MyCourseBloc>()
                          .add(MyCourseEvent.enterAnswer(v)),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.all(4),
                        hintText: 'Submit your response',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () async {
                        if (state.answer.length <= 20) {}

                        if (state.answer != '') {
                          context.read<MyCourseBloc>().add(
                              MyCourseEvent.submitAnswer(
                                  widget.question.questionId!,
                                  int.parse(UserDetailsLocal.userId),
                                  widget.courseId));
                          _ans.text = '';
                          setState(() {});
                          context
                              .read<MyCourseBloc>()
                              .add(const MyCourseEvent.enterAnswer(''));
                          await Future.delayed(const Duration(seconds: 1));
                          // ignore: use_build_context_synchronously
                          context.read<MyCourseBloc>().add(
                              MyCourseEvent.fetchAnswers(widget.courseId,
                                  widget.question.questionId!));
                          return;
                        }
                        return toastMessage("Cannot submit an empty response");
                      },
                      child: const Text("Post"))
                ],
              ),
              Divider(
                color: primaryColor[100],
              ),
              widget.answerList.isEmpty
                  ? const CommonResultsEmptyWidget()
                  : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.answerList.length,
                      itemBuilder: (context, index) {
                        var aTimeDifference = DateTime.now()
                                    .difference(DateTime.parse(
                                        widget.answerList[index].datePosted ??
                                            ''))
                                    .inHours >
                                48
                            ? '${DateTime.now().difference(DateTime.parse(widget.answerList[index].datePosted ?? '')).inDays} days ago'
                            : '${DateTime.now().difference(DateTime.parse(widget.answerList[index].datePosted ?? '')).inHours} hours ago';

                        return Card(
                          margin: const EdgeInsets.only(bottom: 4, top: 4),
                          elevation: 0,
                          color: Colors.grey[200],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl:
                                          UserDetailsLocal.storageBaseUrl +
                                              (widget
                                                      .answerList[index]
                                                      .userPosted
                                                      ?.displayPicture ??
                                                  ""),
                                      placeholder: (context, url) => Container(
                                        width: screenWidth * .12,
                                        height: screenWidth * .12,
                                        padding: const EdgeInsets.all(10),
                                        child: const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      ),
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        width: screenWidth * .12,
                                        height: screenWidth * .12,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Container(
                                        width: screenWidth * .12,
                                        height: screenWidth * .12,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/icons/drawer_icons/display-picture-sltd.png'),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.answerList[index].userPosted
                                                  ?.name ??
                                              '',
                                          style: boldWord,
                                        ),
                                        Text(
                                          "$aTimeDifference, ${widget.answerList[index].timePosted}",
                                          style: smallText,
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    if (widget.answerList[index].userPosted
                                            ?.userId
                                            .toString() ==
                                        UserDetailsLocal.userId)
                                      IconButton(
                                        onPressed: () async {
                                          context.read<MyCourseBloc>().add(
                                              MyCourseEvent.deleteAnswer(
                                                  widget.question.questionId!,
                                                  widget.answerList[index]
                                                      .answerId!,
                                                  widget.courseId));
                                          await Future.delayed(
                                              const Duration(seconds: 1));
                                          // ignore: use_build_context_synchronously
                                          context.read<MyCourseBloc>().add(
                                              MyCourseEvent.fetchAnswers(
                                                  widget.courseId,
                                                  widget.question.questionId!));
                                        },
                                        icon: Icon(
                                          Icons.delete_forever_outlined,
                                          size: 28,
                                          color: primaryColor,
                                        ),
                                        style: IconButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                            alignment: Alignment.topRight),
                                      )
                                  ],
                                ),
                                thickSpace,
                                Text(
                                  widget.answerList[index].answer ?? '',
                                  style: smallText,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
            ],
          ),
        );
      },
    );
  }
}
