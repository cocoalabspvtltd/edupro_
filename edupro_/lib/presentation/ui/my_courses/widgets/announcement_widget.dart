import 'package:cached_network_image/cached_network_image.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/my_course/announcements_response.dart';
import 'package:flutter/material.dart';

class AnnouncementWidget extends StatelessWidget {
  final List<CourseAnnouncementData> courseAnnouncementsList;
  const AnnouncementWidget({
    Key? key,
    required this.courseAnnouncementsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: courseAnnouncementsList.length,
        itemBuilder: (context, index) {
          var timeDifference = DateTime.now()
                      .difference(DateTime.parse(
                          courseAnnouncementsList[index].datePosted ?? ''))
                      .inHours >
                  48
              ? '${DateTime.now().difference(DateTime.parse(courseAnnouncementsList[index].datePosted ?? '')).inDays} days ago'
              : '${DateTime.now().difference(DateTime.parse(courseAnnouncementsList[index].datePosted ?? '')).inHours} hours ago';

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 0,
              color: secondaryColor[50],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: UserDetailsLocal.storageBaseUrl,
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
                              "Posted by",
                              style: boldWord,
                            ),
                            Text(
                              "$timeDifference, ${courseAnnouncementsList[index].timePosted}",
                              style: smallText,
                            )
                          ],
                        )
                      ],
                    ),
                    thickSpace,
                    Text(
                      courseAnnouncementsList[index].announcementTitle ?? '',
                      style: boldValue,
                    ),
                    thickSpace,
                    Text(
                      courseAnnouncementsList[index].announcementSubject ?? '',
                      textAlign: TextAlign.justify,
                      style: smallText,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
