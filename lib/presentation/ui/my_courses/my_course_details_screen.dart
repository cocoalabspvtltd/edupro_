import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:pgs_edupro/application/my_courses/my_course_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/my_course/my_course_videos_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/my_course/my_courses_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/my_course/my_course_repository.dart';
import 'package:pgs_edupro/presentation/ui/my_courses/about_course_screen.dart';
import 'package:pgs_edupro/presentation/ui/my_courses/announcement_screen.dart';
import 'package:pgs_edupro/presentation/ui/my_courses/questions_screen.dart';
import 'package:pgs_edupro/presentation/ui/my_courses/widgets/my_course_videos_list_view.dart';
import 'package:pgs_edupro/presentation/widgets/common_result_empty_widget.dart';
import 'package:pgs_edupro/presentation/widgets/common_server_error_widget.dart';
import 'package:pgs_edupro/presentation/widgets/youtube_player_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class MyCourseDetailsScreen extends StatefulWidget {
  final MyCourseData courseDetails;
  const MyCourseDetailsScreen({super.key, required this.courseDetails});

  @override
  State<MyCourseDetailsScreen> createState() => _MyCourseDetailsScreenState();
}

class _MyCourseDetailsScreenState extends State<MyCourseDetailsScreen> {
  late ScrollController _itemsScrollController;
  // Height of your Container
  static const _containerHeight = 50.0;

  // You don't need to change any of these variables
  var _fromTop = _containerHeight;
  var _allowReverse = true, _allowForward = true;
  var _prevOffset = 0.0;
  var _prevForwardOffset = -_containerHeight;
  var _prevReverseOffset = 0.0;

  // entire logic is inside this listener for ListView
  void _scrollListener() {
    double offset = _itemsScrollController.offset;
    var direction = _itemsScrollController.position.userScrollDirection;

    if (direction == ScrollDirection.reverse) {
      _allowForward = true;
      if (_allowReverse) {
        _allowReverse = false;
        _prevOffset = offset;
        _prevForwardOffset = _fromTop;
      }

      var difference = offset - _prevOffset;
      _fromTop = _prevForwardOffset - difference;
      if (_fromTop > 0) _fromTop = 0;
    } else if (direction == ScrollDirection.forward) {
      _allowReverse = true;
      if (_allowForward) {
        _allowForward = false;
        _prevOffset = offset;
        _prevReverseOffset = _fromTop;
      }

      var difference = offset - _prevOffset;
      _fromTop = _prevReverseOffset - difference;
      if (_fromTop < -_containerHeight) _fromTop = -_containerHeight;
    }
    if (offset == 0) _fromTop = 50;

    setState(
        () {}); // for simplicity I'm calling setState here, you can put bool values to only call setState when there is a genuine change in _fromTop
  }

  bool scrollVisibility = true;

  List videos = [
    "https://www.youtube.com/watch?v=x3bfcM5vWpE",
    "https://www.youtube.com/watch?v=EHACGhdfsas"
  ];

  late MyCourseData courseDetails;

  @override
  void initState() {
    courseDetails = widget.courseDetails;
    _itemsScrollController = ScrollController();
    _itemsScrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _itemsScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyCourseBloc(MyCourseRepository())
        ..add(MyCourseEvent.fetchVideos(courseDetails.courseId!)),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<MyCourseBloc, MyCourseState>(
            //  listener: (context, state) {},
            builder: (context, state) {
              return state.isFetchingData
                  ? SizedBox(
                      height: screenHeight - 180,
                      child: const Center(child: CircularProgressIndicator()),
                    )
                  : state.loadFailureOrSuccessOption.fold(
                      () => Container(),
                      (either) {
                        return either.fold(
                          (failure) {
                            return failure.map(
                              unexpected: (value) => SizedBox(
                                height: screenHeight,
                                child: CommonApiErrorWidget(
                                    "Unexpected Error \nTry Again", () {
                                  context.read<MyCourseBloc>().add(
                                      MyCourseEvent.fetchVideos(
                                          courseDetails.courseId!));
                                }),
                              ),
                              serverError: (value) => SizedBox(
                                height: screenHeight,
                                child: CommonApiErrorWidget(
                                    'Status Code ${value.errorCode}', () {
                                  context.read<MyCourseBloc>().add(
                                      MyCourseEvent.fetchVideos(
                                          courseDetails.courseId!));
                                }),
                              ),
                              serverTimeOut: (value) => SizedBox(
                                height: screenHeight,
                                child: CommonApiErrorWidget(
                                    "Server Timed Out \nTry Again", () {
                                  context.read<MyCourseBloc>().add(
                                      MyCourseEvent.fetchVideos(
                                          courseDetails.courseId!));
                                }),
                              ),
                              unAuthorized: (value) => SizedBox(
                                height: screenHeight,
                                child: CommonApiErrorWidget(value.message, () {
                                  context.read<MyCourseBloc>().add(
                                      MyCourseEvent.fetchVideos(
                                          courseDetails.courseId!));
                                }),
                              ),
                              nullData: (value) => SizedBox(
                                  height: screenHeight,
                                  child: const CommonResultsEmptyWidget()),
                            );
                          },
                          (res) {
                            MyCourseVideosResponse response = res;

                            return OrientationBuilder(
                                builder: (context, orientation) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  !state.isVideoLoading
                                      ? SizedBox(
                                          width: orientation ==
                                                  Orientation.landscape
                                              ? screenHeight
                                              : screenWidth,
                                          height: orientation ==
                                                  Orientation.landscape
                                              ? screenWidth
                                              : screenWidth / 16 * 9,
                                          child: YoutubeVideoPlayerWidget(
                                            url: state.videoUrl,
                                            displayPlayerOnly: true,
                                          ),
                                        )
                                      : Container(
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
                                  orientation == Orientation.landscape
                                      ? const SizedBox(
                                          height: 0,
                                          width: 0,
                                        )
                                      : _detailsWidget(response),
                                ],
                              );
                            });
                          },
                        );
                      },
                    );
            },
          ),
        ),
      ),
    );
  }

  Expanded _detailsWidget(MyCourseVideosResponse response) {
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
                  courseDetails.title ?? '',
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
                    itemCount: courseDetails.instructors!.length > 2
                        ? 2
                        : courseDetails.instructors!.length,
                    itemBuilder: (BuildContext context, int position) {
                      return Text(
                        courseDetails.instructors?[position].name ?? '',
                        style: smallText,
                      );
                    },
                  ),
                ),
                thickSpace,
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: _fromTop < 0 ? 0 : _fromTop),
            child: ContainedTabBarView(
              tabBarProperties: TabBarProperties(
                indicatorColor: primaryColor,
                labelColor: primaryColor,
                labelPadding: const EdgeInsets.all(20),
                indicatorPadding: const EdgeInsets.only(bottom: 2),
                isScrollable: true,
                labelStyle:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              tabs: const [
                Text(
                  'Lectures',
                ),
                Text('More'),
                Text('Live'),
              ],
              views: [
                MyCourseVideosListView(
                  itemsScrollController: _itemsScrollController,
                  videos: response.myCourseVideoData!,
                ),
                _moreWidget(),
                Center(
                  child: Text(
                    'Check announcements for live video updates',
                    style: boldValue,
                  ),
                )
              ],
            ),
          ),
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
          onTap: () => Get.to(() => AboutCourseScreen(
                aboutCourse: courseDetails.aboutCourse!,
                instructors: courseDetails.instructors!,
              )),
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
          onTap: () => Get.to(() => QuestionsScreen(
                courseId: courseDetails.courseId!,
              )),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.announcement_outlined),
          title: Text(
            "Announcement",
            style: boldValue,
          ),
          onTap: () => Get.to(() => AnnouncementScreen(
                courseId: courseDetails.courseId!,
              )),
        ),
        const Divider(),
      ],
    );
  }
}




class InstructorCourseDetailsScreen extends StatefulWidget {
  final Course courseDetails;
  const InstructorCourseDetailsScreen({super.key, required this.courseDetails});

  @override
  State<InstructorCourseDetailsScreen> createState() => _InstructorCourseDetailsScreenState();
}

class _InstructorCourseDetailsScreenState extends State<InstructorCourseDetailsScreen> {
  late ScrollController _itemsScrollController;
  // Height of your Container
  static const _containerHeight = 50.0;

  // You don't need to change any of these variables
  var _fromTop = _containerHeight;
  var _allowReverse = true, _allowForward = true;
  var _prevOffset = 0.0;
  var _prevForwardOffset = -_containerHeight;
  var _prevReverseOffset = 0.0;

  // entire logic is inside this listener for ListView
  void _scrollListener() {
    double offset = _itemsScrollController.offset;
    var direction = _itemsScrollController.position.userScrollDirection;

    if (direction == ScrollDirection.reverse) {
      _allowForward = true;
      if (_allowReverse) {
        _allowReverse = false;
        _prevOffset = offset;
        _prevForwardOffset = _fromTop;
      }

      var difference = offset - _prevOffset;
      _fromTop = _prevForwardOffset - difference;
      if (_fromTop > 0) _fromTop = 0;
    } else if (direction == ScrollDirection.forward) {
      _allowReverse = true;
      if (_allowForward) {
        _allowForward = false;
        _prevOffset = offset;
        _prevReverseOffset = _fromTop;
      }

      var difference = offset - _prevOffset;
      _fromTop = _prevReverseOffset - difference;
      if (_fromTop < -_containerHeight) _fromTop = -_containerHeight;
    }
    if (offset == 0) _fromTop = 50;

    setState(
            () {}); // for simplicity I'm calling setState here, you can put bool values to only call setState when there is a genuine change in _fromTop
  }

  bool scrollVisibility = true;

  List videos = [
    "https://www.youtube.com/watch?v=x3bfcM5vWpE",
    "https://www.youtube.com/watch?v=EHACGhdfsas"
  ];

  late Course courseDetails;

  @override
  void initState() {
    courseDetails = widget.courseDetails ;
    _itemsScrollController = ScrollController();
    _itemsScrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _itemsScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyCourseBloc(MyCourseRepository())
        ..add(MyCourseEvent.fetchVideos(courseDetails.id!)),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<MyCourseBloc, MyCourseState>(
            //  listener: (context, state) {},
            builder: (context, state) {
              return state.isFetchingData
                  ? SizedBox(
                height: screenHeight - 180,
                child: const Center(child: CircularProgressIndicator()),
              )
                  : state.loadFailureOrSuccessOption.fold(
                    () => Container(),
                    (either) {
                  return either.fold(
                        (failure) {
                      return failure.map(
                        unexpected: (value) => SizedBox(
                          height: screenHeight,
                          child: CommonApiErrorWidget(
                              "Unexpected Error \nTry Again", () {
                            context.read<MyCourseBloc>().add(
                                MyCourseEvent.fetchVideos(
                                    courseDetails.id!));
                          }),
                        ),
                        serverError: (value) => SizedBox(
                          height: screenHeight,
                          child: CommonApiErrorWidget(
                              'Status Code ${value.errorCode}', () {
                            context.read<MyCourseBloc>().add(
                                MyCourseEvent.fetchVideos(
                                    courseDetails.id!));
                          }),
                        ),
                        serverTimeOut: (value) => SizedBox(
                          height: screenHeight,
                          child: CommonApiErrorWidget(
                              "Server Timed Out \nTry Again", () {
                            context.read<MyCourseBloc>().add(
                                MyCourseEvent.fetchVideos(
                                    courseDetails.id!));
                          }),
                        ),
                        unAuthorized: (value) => SizedBox(
                          height: screenHeight,
                          child: CommonApiErrorWidget(value.message, () {
                            context.read<MyCourseBloc>().add(
                                MyCourseEvent.fetchVideos(
                                    courseDetails.id!));
                          }),
                        ),
                        nullData: (value) => SizedBox(
                            height: screenHeight,
                            child: const CommonResultsEmptyWidget()),
                      );
                    },
                        (res) {
                      MyCourseVideosResponse response = res;

                      return OrientationBuilder(
                          builder: (context, orientation) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                !state.isVideoLoading
                                    ? SizedBox(
                                  width: orientation ==
                                      Orientation.landscape
                                      ? screenHeight
                                      : screenWidth,
                                  height: orientation ==
                                      Orientation.landscape
                                      ? screenWidth
                                      : screenWidth / 16 * 9,
                                  child: YoutubeVideoPlayerWidget(
                                    url: state.videoUrl,
                                    displayPlayerOnly: true,
                                  ),
                                )
                                    : Container(
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
                                orientation == Orientation.landscape
                                    ? const SizedBox(
                                  height: 0,
                                  width: 0,
                                )
                                    : _detailsWidget(response),
                              ],
                            );
                          });
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Expanded _detailsWidget(MyCourseVideosResponse response) {
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
                  courseDetails.title ?? '',
                  maxLines: 2,
                  style: boldValue,
                ),
                // SizedBox(
                //   height: 15,
                //   child: ListView.separated(
                //     separatorBuilder: (BuildContext context, int index) =>
                //     const VerticalDivider(
                //         thickness: 1, color: Colors.black54),
                //     scrollDirection: Axis.horizontal,
                //     physics: const NeverScrollableScrollPhysics(),
                //     shrinkWrap: true,
                //     itemCount: courseDetails.instructor!.length > 2
                //         ? 2
                //         : courseDetails.instructor!.length,
                //     itemBuilder: (BuildContext context, int position) {
                //       return Text(
                //        // courseDetails.instructor?[position].name ?? '',
                //         style: smallText,
                //       );
                //     },
                //   ),
                // ),
                thickSpace,
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: _fromTop < 0 ? 0 : _fromTop),
            child: ContainedTabBarView(
              tabBarProperties: TabBarProperties(
                indicatorColor: primaryColor,
                labelColor: primaryColor,
                labelPadding: const EdgeInsets.all(20),
                indicatorPadding: const EdgeInsets.only(bottom: 2),
                isScrollable: true,
                labelStyle:
                const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              tabs: const [
                Text(
                  'Lectures',
                ),
                Text('More'),
                Text('Live'),
              ],
              views: [
                MyCourseVideosListView(
                  itemsScrollController: _itemsScrollController,
                  videos: response.myCourseVideoData!,
                ),
                _moreWidget(),
                Center(
                  child: Text(
                    'Check announcements for live video updates',
                    style: boldValue,
                  ),
                )
              ],
            ),
          ),
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
          //   aboutCourse: courseDetails.description!,
          //   instructors: courseDetails.instructor!,
          // )
          // ),
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
          onTap: () => Get.to(() => QuestionsScreen(
            courseId: courseDetails.id!,
          )),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.announcement_outlined),
          title: Text(
            "Announcement",
            style: boldValue,
          ),
          onTap: () => Get.to(() => AnnouncementScreen(
            courseId: courseDetails.id!,
          )),
        ),
        const Divider(),
      ],
    );
  }
}



class InstructorPurschaseCourseDetailsScreen extends StatefulWidget {
  final MyCourseData courseDetails;
  const InstructorPurschaseCourseDetailsScreen({super.key, required this.courseDetails});

  @override
  State<InstructorCourseDetailsScreen> createState() => _InstructorCourseDetailsScreenState();
}

