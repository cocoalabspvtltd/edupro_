import 'package:cached_network_image/cached_network_image.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/course/course_categories_response.dart';
import 'package:pgs_edupro/presentation/ui/course/courses_listing_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseCategoriesGridView extends StatelessWidget {
  final List<CourseCategory> categoryList;

  const CourseCategoriesGridView({
    super.key,
    required this.categoryList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              childAspectRatio: 4 / 3.2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5),
          itemCount: categoryList.length,
          itemBuilder: (BuildContext ctx, index) {
            return InkWell(
              onTap: () {
                Get.to(() => CourseListingScreen(
                    categoryId: categoryList[index].id?.toString() ?? '',
                    categoryName: categoryList[index].categoryName ?? ''));
              },
              child: Card(
                elevation: 1,
                color: Colors.grey[100],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2)),
//margin: const EdgeInsets.fromLTRB(6, 6, 6, 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: screenWidth / 2,
                      height: (screenWidth / 2 - (16)) * 9 / 16,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      //Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: CachedNetworkImage(
                          fit: BoxFit.fitWidth,
                          imageUrl: UserDetailsLocal.storageBaseUrl +
                              (categoryList[index].categoryThumbnail ?? ''),
                          imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                          )),
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
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        categoryList[index].categoryName ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: boldValue,
                      ),
                    ),

                    // SizedBox(
                    //   width: 190,
                    //   child: Text(
                    //     categoryList[index].description ?? "",
                    //     maxLines: 3,
                    //     overflow: TextOverflow.ellipsis,
                    //     style: smallText,
                    //   ),
                    // ),
                    // thickSpace
                  ],
                ),
              ),
            );
          }),
    );
  }
}
