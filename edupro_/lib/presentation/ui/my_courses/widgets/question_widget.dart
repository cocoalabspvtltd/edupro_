import 'package:cached_network_image/cached_network_image.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/my_course/get_questions_response.dart';
import 'package:pgs_edupro/presentation/ui/my_courses/answers_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionWidget extends StatelessWidget {
  final List<QData> qData;
  final int courseId;
  const QuestionWidget({
    Key? key,
    required this.qData,
    required this.courseId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: qData.length,
        itemBuilder: (context, index) {
          var timeDifference = DateTime.now()
                      .difference(DateTime.parse(qData[index].datePosted ?? ''))
                      .inHours >
                  48
              ? '${DateTime.now().difference(DateTime.parse(qData[index].datePosted ?? '')).inDays} days ago'
              : '${DateTime.now().difference(DateTime.parse(qData[index].datePosted ?? '')).inHours} hours ago';

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              margin: EdgeInsets.zero,
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
                              '${UserDetailsLocal.storageBaseUrl}${qData[index].userPosted?.displayPicture}??}',
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
                              qData[index].userPosted?.name ?? "",
                              style: boldWord,
                            ),
                            Text(
                              "$timeDifference , ${qData[index].timePosted}",
                              style: smallText,
                            )
                          ],
                        )
                      ],
                    ),
                    thickSpace,
                    Text(
                      qData[index].questionTitle ?? '',
                      style: boldValue,
                    ),
                    thickSpace,
                    Text(
                      qData[index].questionSubject ?? "",
                      style: smallText,
                    ),
                    TextButton(
                      onPressed: () => Get.to(() => AnswersScreen(
                            question: qData[index],
                            courseId: courseId,
                          )),
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          alignment: Alignment.bottomLeft),
                      child: const Text("Check Response"),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
