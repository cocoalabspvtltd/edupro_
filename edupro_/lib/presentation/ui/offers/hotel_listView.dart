import 'package:cached_network_image/cached_network_image.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/course/course_categories_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/offers/hotel_list_response.dart';
import 'package:pgs_edupro/presentation/ui/course/courses_listing_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pgs_edupro/presentation/ui/offers/hotel_deatils_screen.dart';

class HotelListView extends StatelessWidget {
  final List<HotelList> hoteldetails;
  const HotelListView({super.key, required this.hoteldetails});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 153,
      //width: screenWidth,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: hoteldetails!.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (){
              Get.to(() => HotelDetailsScreen(
                  hoteldetails:hoteldetails![index]
              ));
            },
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                children: [
                  Container(
                    width: 200,
                    height: 130,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: UserDetailsLocal.storageBaseUrl +
                            '${hoteldetails![index].hotelImage}',
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
                  // thickSpace,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
