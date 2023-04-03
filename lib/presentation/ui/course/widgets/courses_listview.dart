import 'package:another_flushbar/flushbar_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pgs_edupro/application/payment/payment_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/course/course_in_category_response.dart';
import 'package:pgs_edupro/presentation/ui/course/course_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class CourseListView extends StatelessWidget {
  final List<CourseList> courseList;
  const CourseListView({super.key, required this.courseList});

  @override
  Widget build(BuildContext context) {


    return BlocConsumer<PaymentBloc, PaymentState>(
      listener: (context, state) {
        state.getPaymentSuccessOrFailureOption.fold(() {}, (either) {
          either.fold((failure) {
            FlushbarHelper.createError(
              message: failure.map(
                unexpected: (value) => 'Unexpected Error',
                serverError: (value) => 'Server Error',
                serverTimeOut: (value) => 'Server Timed Out',
                unAuthorized: (value) => value.message,
                nullData: (value) => 'Data Not Found',
              ),
            ).show(context);
          }, (r) {});
        });
      },
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: courseList.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Get.to(() =>
                    CourseDetailsScreen(courseDetails: courseList[index]));
              },
              child: Card(
                elevation: 0,
                color: Colors.grey[200],
                shape: RoundedRectangleBorder(
                    // side: BorderSide(color: primaryColor, width: .2),
                    borderRadius: BorderRadius.circular(6)),
                margin: const EdgeInsets.fromLTRB(6, 6, 6, 6),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        // margin: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: UserDetailsLocal.storageBaseUrl +
                                (courseList[index].courseThumbnail ?? ''),
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
                      const SizedBox(
                        width: 8,
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: screenWidth - 116,
                            child: Text(
                              courseList[index].title ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: primaryColor),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          SizedBox(
                            height: 15,
                            child: ListView.separated(
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const VerticalDivider(
                                          thickness: 1, color: Colors.black54),
                              scrollDirection: Axis.horizontal,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  courseList[index].instructors!.length > 2
                                      ? 2
                                      : courseList[index].instructors!.length,
                              itemBuilder:
                                  (BuildContext context, int position) {
                                return Text(
                                  courseList[index]
                                          .instructors?[position]
                                          .name ??
                                      '',
                                  style: smallText,
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Text(
                                "4.75",
                                style: TextStyle(
                                    color: Colors.yellow[900],
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              RatingBarIndicator(
                                rating: 4.75,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 18.5,
                                direction: Axis.horizontal,
                              ),
                              Text(
                                "(35894)",
                                style: smallText,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            rupeeSymbol + (courseList[index].price ?? ''),
                            style: boldValue,
                          ),
                        ],
                      ),
                      // ElevatedButton(
                      //     onPressed: () => context.read<PaymentBloc>().add(
                      //           PaymentEvent.startPayment(
                      //               courseList[index].price ?? '',
                      //               "COURSE PAYMENT",
                      //               courseId: courseList[index].courseId),
                      //         ),
                      //     child: const Text("Buy Now")),
                      // thickSpace,
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   crossAxisAlignment: CrossAxisAlignment.end,
                      //   children: [
                      //     Text(
                      //       "Description ",
                      //       style: boldHeading,
                      //     ),
                      //     Expanded(
                      //       child: Divider(
                      //         color: primaryColor,
                      //         thickness: 1,
                      //       ),
                      //     )
                      //   ],
                      // ),
                      // SizedBox(
                      //   width: screenWidth - 24,
                      //   child: Text(
                      //     courseList[index].aboutCourse?.aboutDescription ?? "",
                      //     maxLines: 3,
                      //     overflow: TextOverflow.ellipsis,
                      //     style: smallText,
                      //   ),
                      // ),
                      thickSpace
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
