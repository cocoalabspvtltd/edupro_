import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/my_course/my_courses_response.dart';
import 'package:flutter/material.dart';

class AboutCourseScreen extends StatelessWidget {
  final AboutCourse aboutCourse;
  final List<Instructors> instructors;
  const AboutCourseScreen(
      {super.key, required this.instructors, required this.aboutCourse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About this Course"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                aboutCourse.aboutTitle ?? '',
                style: boldHeading,
              ),
              thickSpace,
              thickSpace,
              Html(
                data:  aboutCourse.aboutDescription,
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
              thickSpace,
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
                itemCount: instructors.length,
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
                                  borderRadius: BorderRadius.circular(8),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl:
                                        "${UserDetailsLocal.storageBaseUrl}${instructors[position].name ?? ''} ",
                                    placeholder: (context, url) => Container(
                                      margin: const EdgeInsets.all(1),
                                      child: const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      margin: const EdgeInsets.all(0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover)),
                                    ),
                                    errorWidget: (context, url, error) =>
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${instructors[position].name ?? ''} ",
                                  style: boldValue,
                                ),
                                Text(
                                  "${instructors[position].qualification ?? ''} ",
                                  style: standardText,
                                ),
                                Text(
                                  "${instructors[position].instituteName ?? ''} ",
                                  style: standardText,
                                ),
                              ],
                            ),
                          ],
                        ),
                        thickSpace,
                        Text(
                          "${instructors[position].description ?? ''} ",
                          style: standardText,
                        ),
                        const Divider()
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
