import 'package:cached_network_image/cached_network_image.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/course/course_categories_response.dart';
import 'package:pgs_edupro/presentation/ui/course/courses_listing_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseCategoriesListView extends StatelessWidget {
  final List<CourseCategory> categoryList;
  const CourseCategoriesListView({super.key, required this.categoryList});

  @override
  Widget build(BuildContext context) {
    print("List");
    return SizedBox(
      height: 113,
      //width: screenWidth,
      child: ListView.builder(
        reverse: true,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Get.to(() => CourseListingScreen(
                    categoryId: categoryList[index].id?.toString() ?? '',
                    categoryName: categoryList[index].categoryName ?? '',
                  ));
            },
            child: Card(
              color: Colors.grey[100],
              elevation: 0,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: primaryColor, width: .5),
                  borderRadius: BorderRadius.circular(6)),
              margin: const EdgeInsets.fromLTRB(6, 6, 6, 6),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  children: [
                    Container(
                      width: 190,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: UserDetailsLocal.storageBaseUrl +
                              (categoryList[index].categoryThumbnail ?? ''),
                          imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover))),
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) => const Image(
                            image: AssetImage(
                                'assets/images/video_thumpnail_error.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    thickSpace,
                    SizedBox(
                      width: 190,
                      child: Text(
                        categoryList[index].categoryName ?? "",
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: boldValue,
                      ),
                    ),
                    // thickSpace,
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
