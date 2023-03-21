import 'package:cached_network_image/cached_network_image.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/my_course/my_courses_response.dart';
import 'package:pgs_edupro/presentation/ui/my_courses/my_course_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PurchaseScreen extends StatelessWidget {
  const PurchaseScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Purchased Courses",
          style: boldValuePrimaryColor,
        ),
      ),
      body: Column(
        children: [
          thickSpace,
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  // Get.to(() => PurchaseDetailsScreen());
                },
                child: Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(4),
                  color: Colors.grey[200],
                  height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        margin: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: 'assets/images/video_thumpnail_error.png',
                            imageBuilder: (context, imageProvider) => Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: imageProvider, fit: BoxFit.cover))),
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) => const Image(
                              image: AssetImage('assets/images/video_thumpnail_error.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      thickSpace,
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: screenWidth - 120,
                              child: Text(
                                "Course Titile",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: primaryColor),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              height: 15,
                              child: ListView.separated(
                                separatorBuilder: (BuildContext context, int index) =>
                                const VerticalDivider(
                                    thickness: 1, color: Colors.black54),
                                scrollDirection: Axis.horizontal,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 4,
                                itemBuilder: (BuildContext context, int position) {
                                  return Text(
                                        'Name ',
                                    style: smallText,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Course Duration 1 year",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
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
          ),
        ],
      ),
    );
  }
}
