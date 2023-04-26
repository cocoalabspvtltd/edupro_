import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/insistution/insistutionResponse.dart';
import 'package:pgs_edupro/presentation/widgets/youtube_player_widget.dart';

class ViewCourseDetailsScreen extends StatefulWidget {
  final Course coursedetails;
  const ViewCourseDetailsScreen({super.key, required this.coursedetails});

  @override
  State<ViewCourseDetailsScreen> createState() =>
      _ViewCourseDetailsScreenState();
}

class _ViewCourseDetailsScreenState extends State<ViewCourseDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTheme("Course  details"),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  shadowColor: primaryColor[300],
                  elevation: 4,
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      thickSpace,
                      SizedBox(
                        width: screenWidth,
                        child: Padding(
                          padding:
                          const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  width: 140,
                                  height: 140,
                                  padding: EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                    color: Colors.black87,
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(60),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.fill,
                                      imageUrl:UserDetailsLocal.storageBaseUrl+'${widget.coursedetails.courseThumbnail}',
                                      placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                      errorWidget: (context, url, error) => CircleAvatar(
                                        radius: 46.0,
                                        backgroundImage:
                                        AssetImage('assets/icons/profile_icons/person.png'),
                                        backgroundColor: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              thickSpace,
                              Row(children: [
                                Icon(Icons.person_outline,color: primaryColor,),
                                SizedBox(width: 10,),
                                Text("${widget.coursedetails.instructor}",style: details,)
                              ],),
                              thickSpace,
                              Row(children: [
                                Icon(Icons.collections_bookmark_sharp,color: primaryColor,),
                                SizedBox(width: 10,),
                                Text("${widget.coursedetails.title}",style: details,)
                              ],),
                              thickSpace,
                              Row(children: [
                                Icon(Icons.business_outlined,color: primaryColor,),
                                SizedBox(width: 10,),
                                Text("${widget.coursedetails.institution}",style: details,)
                              ],),
                              thickSpace,
                              Row(children: [
                                Icon(Icons.cast_for_education,color: primaryColor,),
                                SizedBox(width: 10,),
                                Text("${widget.coursedetails.category}",style: details,)
                              ],),
                              thickSpace,
                              Row(children: [
                                Icon(Icons.attach_money_outlined,color: primaryColor,),
                                SizedBox(width: 10,),
                                Text("${widget.coursedetails.amount}",style: details,)
                              ],),
                              thickSpace,
                              Row(children: [
                                Icon(Icons.timelapse,color: primaryColor,),
                                SizedBox(width: 10,),
                                Text("${widget.coursedetails.duration}",style: details,)
                              ],),
                              thickSpace,
                              // Container(
                              //   width: screenWidth,
                              //   height: screenWidth / 2,
                              //   decoration: const BoxDecoration(
                              //     color: Colors.black,
                              //     borderRadius: BorderRadius.all(Radius.circular(0)),
                              //   ),
                              //   child: ClipRRect(
                              //     borderRadius: BorderRadius.circular(0),
                              //     child:
                              //     //courseList.coursePreviewVideoUrl?.isNotEmpty ?? false
                              //     // ?
                              //     YoutubeVideoPlayerWidget(
                              //       url: "${widget.coursedetails.url}",
                              //       displayPlayerOnly: true,
                              //       hideFullScreenButtton: true,
                              //       repeatForever: true,
                              //     ),
                              //     //         : CachedNetworkImage(
                              //     //             fit: BoxFit.cover,
                              //     //             imageUrl: UserDetailsLocal.storageBaseUrl +
                              //     //                 (courseList.courseThumbnail ?? ''),
                              //     //             imageBuilder: (context, imageProvider) => Container(
                              //     //                 decoration: BoxDecoration(
                              //     //                     image: DecorationImage(
                              //     //                         image: imageProvider,
                              //     //                         fit: BoxFit.cover))),
                              //     //             placeholder: (context, url) => const Center(
                              //     //               child: CircularProgressIndicator(),
                              //     //             ),
                              //     //             errorWidget: (context, url, error) => const Image(
                              //     //               image: AssetImage(
                              //     //                   'assets/images/video_thumpnail_error.png'),
                              //     //               fit: BoxFit.cover,
                              //     //             ),
                              //     //           ),
                              //   ),
                              // ),
                              Row(children: [
                                Icon(Icons.video_collection_outlined,color: primaryColor,),
                                SizedBox(width: 10,),
                                Text("${widget.coursedetails.url}",style: details,)
                              ],),
                              thickSpace,
                              thickSpace,
                            ],
                          ),
                        ),
                      ),
                      thickSpace,
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  shadowColor: primaryColor[300],
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        thickSpace,
                        Text(
                          "${widget.coursedetails.title} ",
                          style: TextStyle(
                              fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                        Html(
                          data: widget.coursedetails.description,
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
                        thickSpace,
                        Text("${widget.coursedetails.aboutTitle}",style: details,),
                        Html(
                          data: widget.coursedetails.aboutDescription,
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
                      ],
                    ),
                  ),
                ),
              ),
              thickSpace,
            ],
          ),
        ),
      ),
    );
  }
}
