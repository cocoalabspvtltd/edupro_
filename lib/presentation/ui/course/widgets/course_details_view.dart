import 'dart:convert';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:pgs_edupro/application/payment/payment_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/domain/core/network/api_provider.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/course/course_in_category_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pgs_edupro/infrastructure/remote_data/source/api.dart';
import 'package:pgs_edupro/presentation/ui/payment/payment_form_screen.dart';
import 'package:pgs_edupro/presentation/widgets/youtube_player_widget.dart';
import 'package:http/http.dart' as http;

class CourseDetailsView extends StatelessWidget {
  final CourseList courseList;
   CourseDetailsView({super.key, required this.courseList});
  Map OrderIdResponse ={};
  String OderId="";
  ApiProvider? apiprovider;
  Future getOrderId() async {
    print("Get order");
    // final response =
    // await apiprovider?.getJsonInstance().get(Api.getOrderId);
    // final response = await apiprovider?.getJsonInstance()
    //     .get("https://pgsedu.com/EduPro/index.php/api/get_orderId",
    //     options: Options(
    //         headers: {
    //           'Accept':'application/json',
    //           'Authorization':"Bearer " + UserDetailsLocal.apiToken,
    //         }
    //     )
    // );
    http.Response response = await http.get(Uri.parse('https://pgsedu.com/EduPro/index.php/api/get_orderId'),
      headers: <String, String>{
        'Accept': "appilication/json",
        'Authorization': 'Bearer ${UserDetailsLocal.apiToken}',

      },);
    print("Response${response.body}");
    var jsonData = json.decode(response.body);
    OrderIdResponse = jsonData;
    OderId = OrderIdResponse["orderId"];
    print("orderId->${OderId}");
    if(response.statusCode==200){
      Get.to(() =>  PaymentFormScreen(orderid:OderId, courseDetails: courseList,));
    }
     return response;
  }
  @override
  void initState() {
    getOrderId();
  }

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
        String? whatYouLearn = courseList.aboutCourse?.aboutDescription
                ?.split('What you')
                .last
                .split('ll learn')
                .last
                .split('Are there any course requirements or prerequisites?')
                .first ??
            '';

        String? prerequisties = courseList.aboutCourse?.aboutDescription
                ?.split('What you')
                .last
                .split('ll learn')
                .last
                .split('Are there any course requirements or prerequisites?')
                .last
                .split('Who this course is for:')
                .first ??
            '';

        String? whoThisCourseFor = courseList.aboutCourse?.aboutDescription
                ?.split('What you')
                .last
                .split('ll learn')
                .last
                .split('Are there any course requirements or prerequisites?')
                .last
                .split('Who this course is for:')
                .last ??
            '';

        whatYouLearn = whatYouLearn.replaceAll('\n', ' \n\n ');
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: screenWidth,
                height: screenWidth / 2,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child:
                      //courseList.coursePreviewVideoUrl?.isNotEmpty ?? false
                      // ?
                      YoutubeVideoPlayerWidget(
                    url: courseList.coursePreviewVideoUrl!,
                    displayPlayerOnly: true,
                    hideFullScreenButtton: true,
                    repeatForever: true,
                  ),
                  //         : CachedNetworkImage(
                  //             fit: BoxFit.cover,
                  //             imageUrl: UserDetailsLocal.storageBaseUrl +
                  //                 (courseList.courseThumbnail ?? ''),
                  //             imageBuilder: (context, imageProvider) => Container(
                  //                 decoration: BoxDecoration(
                  //                     image: DecorationImage(
                  //                         image: imageProvider,
                  //                         fit: BoxFit.cover))),
                  //             placeholder: (context, url) => const Center(
                  //               child: CircularProgressIndicator(),
                  //             ),
                  //             errorWidget: (context, url, error) => const Image(
                  //               image: AssetImage(
                  //                   'assets/images/video_thumpnail_error.png'),
                  //               fit: BoxFit.cover,
                  //             ),
                  //           ),
                ),
              ),
              thickSpace,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      courseList.title ?? "",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: primaryColor),
                    ),
                    thickSpace,
                    if (courseList.aboutCourse?.aboutTitle?.isNotEmpty ??
                        false) ...[
                      Text(
                        courseList.aboutCourse?.aboutTitle ?? "",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[700]),
                      ),
                      thickSpace,
                    ],
                    Row(
                      children: [
                        const Text(
                          "4.75",
                          style: TextStyle(fontWeight: FontWeight.w600),
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
                          itemSize: 20,
                          direction: Axis.horizontal,
                        ),
                        Text(
                          "(35894 ratings)",
                          style: smallText,
                        )
                      ],
                    ),
                    thickSpace,
                    Text(
                      "Course duration ${courseList.courseDuration ?? ''}",
                      style: boldValue,
                    ),
                    thickSpace,
                    thickSpace,
                    Text(
                      rupeeSymbol + (courseList.price ?? ''),
                      style: boldHeading,
                    ),
                    thickSpace,
                    SizedBox(
                      width: screenWidth,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            print("---->${OderId}");
                            getOrderId();


                          },
                          // => context.read<PaymentBloc>().add(
                          //       PaymentEvent.startPayment(
                          //           courseList.price ?? '', "COURSE PAYMENT",
                          //           courseId: courseList.courseId),
                          //     ),
                          child: const Text("Buy Now")),
                    ),
                    thickSpace,
                    thickSpace,
                    if (courseList.aboutCourse?.aboutDescription?.isNotEmpty ??
                        false) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Description ",
                            style: boldHeading,
                          ),
                          Expanded(
                            child: Divider(
                              color: primaryColor,
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                      thickSpace,
                      Html(
                        data: courseList.aboutCourse?.aboutDescription,
                        tagsList: Html.tags..addAll(["bird", "flutter"]),
                        style: {
                          'h5': Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
                        },
                        customRender: {
                          "bird": (RenderContext context, Widget child) {
                            return TextSpan(text: "🐦");
                          },
                          "flutter": (RenderContext context, Widget child) {
                            return FlutterLogo(
                              style: (context.tree.element!.attributes['horizontal'] != null)
                                  ? FlutterLogoStyle.horizontal
                                  : FlutterLogoStyle.markOnly,
                              textColor: context.style.color!,
                              size: context.style.fontSize!.size! * 5,
                            );
                          },
                        },
                        onLinkTap: (url, _, __, ___) {
                          print("Opening $url...");
                        },
                        onImageTap: (src, _, __, ___) {
                          print(src);
                        },
                        onImageError: (exception, stackTrace) {
                        },
                        onCssParseError: (css, messages) {
                          messages.forEach((element) {
                            print(element);
                          });
                        },
                      ),
                    //   Text(
                    //     courseList.aboutCourse?.aboutDescription
                    //             ?.split('What you')
                    //             .first ??
                    //         "",
                    //     textAlign: TextAlign.justify,
                    //     style: TextStyle(
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.w500,
                    //         color: Colors.grey[700]),
                    //   ),
                    //   if (courseList.aboutCourse?.aboutDescription
                    //           ?.contains("What you") ??
                    //       false) ...[
                    //     Text(
                    //       "What you'll learn",
                    //       textAlign: TextAlign.justify,
                    //       style: boldWord,
                    //     ),
                    //     Text(
                    //       whatYouLearn,
                    //       textAlign: TextAlign.left,
                    //       style: TextStyle(
                    //           fontSize: 16,
                    //           fontWeight: FontWeight.w500,
                    //           color: Colors.grey[700]),
                    //     ),
                    //   ],
                    //   if (courseList.aboutCourse?.aboutDescription?.contains(
                    //           'Are there any course requirements or prerequisites?') ??
                    //       false) ...[
                    //     Text(
                    //       'Are there any course requirements or prerequisites?',
                    //       textAlign: TextAlign.justify,
                    //       style: boldWord,
                    //     ),
                    //     Text(
                    //       prerequisties,
                    //       textAlign: TextAlign.left,
                    //       style: TextStyle(
                    //           fontSize: 16,
                    //           fontWeight: FontWeight.w500,
                    //           color: Colors.grey[700]),
                    //     ),
                    //   ],
                    //   if (courseList.aboutCourse?.aboutDescription
                    //           ?.contains('Who this course is for:') ??
                    //       false) ...[
                    //     Text(
                    //       'Who this course is for:',
                    //       textAlign: TextAlign.justify,
                    //       style: boldWord,
                    //     ),
                    //     Text(
                    //       whoThisCourseFor,
                    //       textAlign: TextAlign.left,
                    //       style: TextStyle(
                    //           fontSize: 16,
                    //           fontWeight: FontWeight.w500,
                    //           color: Colors.grey[700]),
                    //     ),
                    //   ],
                    //   thickSpace,
                    //   thickSpace,
                     ],
                    thickSpace,
                    thickSpace,
                    if (courseList.instructors?.isNotEmpty ?? false) ...[
                      Text(
                        "Instructors",
                        textAlign: TextAlign.justify,
                        style: boldWord,
                      ),
                      thickSpace,
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: courseList.instructors?.length,
                        itemBuilder: (BuildContext context, int position) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: screenWidth * .14,
                                        height: screenWidth * .14,
                                        padding: const EdgeInsets.all(1),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: secondaryColor[50],
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl:
                                                "${UserDetailsLocal.storageBaseUrl}${courseList.instructors?[position].name ?? ''} ",
                                            placeholder: (context, url) =>
                                                Container(
                                              margin: const EdgeInsets.all(1),
                                              child: const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            ),
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              margin: const EdgeInsets.all(0),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.cover)),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Container(
                                              width: screenWidth * .14,
                                              height: screenWidth * .14,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/icons/drawer_icons/display-picture-sltd.png'),
                                                  )),
                                            ),
                                          ),
                                        )),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${courseList.instructors?[position].name ?? ''} ",
                                          style: boldValue,
                                        ),
                                        Text(
                                          "${courseList.instructors?[position].qualification ?? ''} ",
                                          style: standardText,
                                        ),
                                        Text(
                                          "${courseList.instructors?[position].instituteName ?? ''} ",
                                          style: standardText,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                thickSpace,
                                Text(
                                  "${courseList.instructors?[position].description ?? ''} ",
                                  style: standardText,
                                ),
                                const Divider()
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
