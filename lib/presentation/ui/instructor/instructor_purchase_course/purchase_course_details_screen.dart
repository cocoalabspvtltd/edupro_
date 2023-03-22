import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pgs_edupro/domain/core/constants.dart';

class PurchaseDetailsScreen extends StatefulWidget {
  const PurchaseDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PurchaseDetailsScreen> createState() => _PurchaseDetailsScreenState();
}

class _PurchaseDetailsScreenState extends State<PurchaseDetailsScreen> {
  late ScrollController _itemsScrollController;
  static const _containerHeight = 50.0;

  var _fromTop = _containerHeight;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.black,
              height: screenWidth / 16 * 9,
              width: screenWidth,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:
                CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  SizedBox(
                    height:
                    screenWidth / 16 * 9 - 90,
                    width: screenWidth,
                    child:
                    CupertinoActivityIndicator(
                      color: primaryColor,
                      radius: 30,
                    ),
                  ),
                ],
              ),
            ),
            _detailsWidget(),
          ],
        ),
      ),
    );
  }

  Expanded _detailsWidget( ) {
    return Expanded(
      child: Stack(
        children: [
          Positioned(
            left: 8,
            right: 8,
            top: _fromTop - 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                thickSpace,
                Text(
                  "title",
                  maxLines: 2,
                  style: boldValue,
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
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int position) {
                      return Text("instructorname",
                        style: smallText,
                      );
                    },
                  ),
                ),
                thickSpace,
                _moreWidget()
              ],
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.only(top: _fromTop < 0 ? 0 : _fromTop),
          //   child: ContainedTabBarView(
          //     tabBarProperties: TabBarProperties(
          //       indicatorColor: primaryColor,
          //       labelColor: primaryColor,
          //       labelPadding: const EdgeInsets.all(20),
          //       indicatorPadding: const EdgeInsets.only(bottom: 2),
          //       isScrollable: true,
          //       labelStyle:
          //       const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          //     ),
          //     tabs: const [
          //       Text(
          //         'Lectures',
          //       ),
          //       Text('More'),
          //       Text('Live'),
          //     ],
          //     views: [
          //       // MyCourseVideosListView(
          //       //   itemsScrollController: _itemsScrollController,
          //       //   videos: response.myCourseVideoData!,
          //       // ),
          //       _moreWidget(),
          //       Center(
          //         child: Text(
          //           'Check announcements for live video updates',
          //           style: boldValue,
          //         ),
          //       )
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _moreWidget() {
    return ListView(
      // controller: _itemsScrollController,
      // physics: AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        const Divider(),
        ListTile(
          leading: const Icon(Icons.abc_outlined),
          title: Text(
            "About this Course",
            style: boldValue,
          ),
          // onTap: () => Get.to(() => AboutCourseScreen(
          //   aboutCourse: courseDetails.aboutCourse!,
          //   instructors: courseDetails.instructors!,
          // )),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.school_outlined),
          title: Text(
            "Certificate Template",
            style: boldValue,
          ),
        ),
        const Divider(),
        ListTile(
          leading: Icon(
            Icons.school_outlined,
            color: Colors.grey[400],
          ),
          title: Text(
            "Download Certificate",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey[400]),
          ),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.question_answer_outlined),
          title: Text(
            "Q&A",
            style: boldValue,
          ),
          // onTap: () => Get.to(() => QuestionsScreen(
          //   courseId: courseDetails.courseId!,
          // )),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.announcement_outlined),
          title: Text(
            "Announcement",
            style: boldValue,
          ),
          // onTap: () => Get.to(() => AnnouncementScreen(
          //   courseId: courseDetails.courseId!,
          // )),
        ),
        const Divider(),
      ],
    );
  }
}
