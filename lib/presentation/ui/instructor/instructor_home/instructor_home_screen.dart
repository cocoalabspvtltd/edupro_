import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:pgs_edupro/application/ads/ads_bloc.dart';
import 'package:pgs_edupro/application/video/top_videos/top_videos_bloc.dart';
import 'package:pgs_edupro/application/video/trending_videos/trending_videos_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/ads/ads_repository.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/videos/video_repository.dart';
import 'package:pgs_edupro/presentation/ui/instructor/instructor_home/widgets/instructor_drawer.dart';
import 'package:pgs_edupro/presentation/ui/instructor/instructor_home/widgets/instructor_home_body.dart';
import 'package:pgs_edupro/presentation/ui/instructor/instructor_home/widgets/instructor_menu_button.dart';
import 'package:pgs_edupro/presentation/ui/instructor/instructor_profile/instructor_profile_screen.dart';

class InstructorHomeScreen extends StatefulWidget {
  final int selectedIndex;
  const InstructorHomeScreen({super.key, this.selectedIndex = 0});

  @override
  State<InstructorHomeScreen> createState() => _InstructorHomeScreenState();
}

class _InstructorHomeScreenState extends State<InstructorHomeScreen> {
  DateTime? currentBackPressTime;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late int _selectedIndex;
  // late PageController _pageController;
  List title = ['Home', 'My Courses', 'Classes', 'My Profile'];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  // void dispose() {
  //   _pageController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    print("");
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //     create: (_) => ProfileBloc(ProfileRepository())
        //       ..add(ProfileEvent.loadMyProfile(
        //           int.parse(UserDetailsLocal.userId)))),
        BlocProvider(
            create: (_) =>
                AdsBloc(AdsRepository())..add(const AdsEvent.getAds())),
        BlocProvider(
          create: (_) => TrendingVideosBloc(VideoRepository())
            ..add(const TrendingVideosEvent.loadVideos()),
        ),
        BlocProvider(
          create: (_) => TopVideosBloc(VideoRepository())
            ..add(const TopVideosEvent.loadVideos()),
        ),
      ],
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            title[_selectedIndex],
            style: appBarText,
          ),
          leading: InstructorMenuSwitch(_scaffoldKey),
          leadingWidth: 38,
        ),
        drawer: InstructorDrawerWidget(
          context: context,
          scaffoldKey: _scaffoldKey,
        ),
        body: WillPopScope(
            onWillPop: () {
              DateTime now = DateTime.now();
              if (currentBackPressTime == null ||
                  now.difference(currentBackPressTime!) >
                      Duration(seconds: 2)) {
                currentBackPressTime = now;
                Text("Double press back to exit");
                return Future.value(false);
              }
              return Future.value(true);
            },
            child: _selectedIndex == 3
                ? InstructorProfileScreen()
                : _selectedIndex == 2
                    ? GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 400,
                                childAspectRatio: 3 / 3.5,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5),
                        itemCount: 5,
                        itemBuilder: (BuildContext ctx, index) {
                          return InkWell(
                            onTap: () {
                              FlutterWebBrowser.openWebPage(
                                url:
                                    "https://us05web.zoom.us/j/84655957153?pwd=NURqOTJqNlBOTzRaRHlBYzFhbHhRZz09",
                                customTabsOptions: CustomTabsOptions(
                                  colorScheme: CustomTabsColorScheme.dark,
                                  defaultColorSchemeParams:
                                      CustomTabsColorSchemeParams(
                                          toolbarColor: primaryColor),
                                  shareState: CustomTabsShareState.on,
                                  instantAppsEnabled: true,
                                  showTitle: true,
                                  urlBarHidingEnabled: true,
                                ),
                                safariVCOptions:
                                    const SafariViewControllerOptions(
                                  barCollapsingEnabled: true,
                                  preferredBarTintColor: Colors.green,
                                  preferredControlTintColor: Colors.amber,
                                  dismissButtonStyle:
                                      SafariViewControllerDismissButtonStyle
                                          .close,
                                  modalPresentationCapturesStatusBarAppearance:
                                      true,
                                ),
                              );
                              return;
                            },
                            child: Card(
                              color: scaffoldBackgroundColor,
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2)),
                              //margin: const EdgeInsets.fromLTRB(6, 6, 6, 6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: (screenWidth / 2 - (10)) * 9 / 16,
                                    width: screenWidth / 2 - (10),
                                    // margin: const EdgeInsets.all(.5),
                                    decoration: BoxDecoration(
                                        // border: Border.all(width: .5, color: primaryColor),
                                        borderRadius: BorderRadius.circular(6)),
                                    //Expanded(
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(2),
                                        child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          imageUrl:
                                              'assets/images/video_thumpnail_error.png',
                                          placeholder: (context, url) =>
                                              const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Image(
                                            image: AssetImage(
                                                'assets/images/video_thumpnail_error.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        )),
                                  ),
                                  thickSpace,
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      " title",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: boldValue,
                                    ),
                                  ),
                                  thickSpace,
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      "description",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: smallText,
                                    ),
                                  ),
                                  thickSpace
                                ],
                              ),
                            ),
                          );
                        })
                    : _selectedIndex == 1
                        ? Text("jbkn")
                        : _selectedIndex == 0
                            ? IstructorHomeBody()
                            : Center(child: Text("hai"))),
        bottomNavigationBar: BottomNavyBar(
            backgroundColor: Colors.black,
            //containerHeight: 60,
            selectedIndex: _selectedIndex,
            showElevation: false, // use this to remove appBar's elevation
            itemCornerRadius: 6,
            onItemSelected: (index) => setState(() {
                  _selectedIndex = index;
                }),
            items: [
              BottomNavyBarItem(
                icon: _selectedIndex == 0
                    ? Image.asset(
                        'assets/icons/drawer_icons/home-sltd.png',
                        height: 25,
                        fit: BoxFit.contain,
                      )
                    : Image.asset(
                        'assets/icons/drawer_icons/home.png',
                        color: Colors.white,
                        height: 25,
                        fit: BoxFit.contain,
                      ), //const Icon(Icons.apps),
                title: const Text(
                  'Home',
                ),
                activeColor: primaryColor,
              ),
              BottomNavyBarItem(
                icon: _selectedIndex == 1
                    ? Image.asset(
                        'assets/icons/drawer_icons/my-course-sltd.png',
                        height: 30,
                        fit: BoxFit.contain,
                      )
                    : Image.asset(
                        'assets/icons/drawer_icons/my-course.png',
                        color: Colors.white,
                        height: 25,
                        fit: BoxFit.contain,
                      ),
                title: const Text(
                  'My Courses',
                ),
                activeColor: primaryColor,
              ),
              BottomNavyBarItem(
                icon: _selectedIndex == 2
                    ? Image.asset(
                        'assets/icons/drawer_icons/library-sltd.png',
                        height: 25,
                        fit: BoxFit.contain,
                      )
                    : Image.asset(
                        'assets/icons/drawer_icons/library.png',
                        color: Colors.white,
                        height: 25,
                        fit: BoxFit.contain,
                      ),
                title: const Text(
                  'Classes',
                ),
                activeColor: primaryColor,
              ),
              BottomNavyBarItem(
                icon:  _selectedIndex == 3 ?Image.asset('assets/icons/drawer_icons/profile-sltd.png',
                  height: 30,
                  fit: BoxFit.contain,
                ):Image.asset('assets/icons/drawer_icons/profile.png', color: Colors.white,
                  height: 25,
                  fit: BoxFit.contain,),
                title: const Text(
                  'My Profile',
                ),
                activeColor: primaryColor,
              ),
            ]),
      ),
    );
    //   MultiBlocProvider(
    //   providers: [
    //     // BlocProvider(
    //     //   create: (_) => PaymentBloc(PaymentRepository()),
    //     // ),
    //     // BlocProvider(
    //     //   create: (_) => TrendingVideosBloc(VideoRepository())
    //     //     ..add(const TrendingVideosEvent.loadVideos()),
    //     // ),
    //     // BlocProvider(
    //     //   create: (_) => TopVideosBloc(VideoRepository())
    //     //     ..add(const TopVideosEvent.loadVideos()),
    //     // ),
    //     // BlocProvider(
    //     //   create: (_) => CoursesBloc(CourseRepository())
    //     //     ..add(const CoursesEvent.loadCourseCategories()),
    //     // ),
    //     // BlocProvider(
    //     //     create: (_) => ProfileBloc(ProfileRepository())
    //     //       ..add(ProfileEvent.loadMyProfile(
    //     //           int.parse(UserDetailsLocal.userId)))),
    //     // BlocProvider(
    //     //     create: (_) =>
    //     //     AdsBloc(AdsRepository())..add(const AdsEvent.getAds())),
    //   ],
    //   child: Scaffold(
    //     key: _scaffoldKey,
    //     appBar: AppBar(
    //       title: Text(
    //         title[_selectedIndex],
    //         style: appBarText,
    //       ),
    //       leading: MenuSwitch(_scaffoldKey),
    //       leadingWidth: 38,
    //     ),
    //     drawer: InstructorDrawerWidget(
    //       context: context,
    //       scaffoldKey: _scaffoldKey,
    //     ),
    //     body: SafeArea(
    //       child: Text("jknk"),
    //     ),
    //     bottomNavigationBar: BottomNavyBar(
    //         backgroundColor: primaryColor[50],
    //         //containerHeight: 60,
    //         selectedIndex: _selectedIndex,
    //         showElevation: false, // use this to remove appBar's elevation
    //         itemCornerRadius: 6,
    //         onItemSelected: (index) => setState(() {
    //           _selectedIndex = index;
    //           _pageController.animateToPage(index,
    //               duration: const Duration(milliseconds: 300),
    //               curve: Curves.ease);
    //         }),
    //         items: [
    //           BottomNavyBarItem(
    //             icon: Image.asset(
    //               _selectedIndex == 0
    //                   ? 'assets/icons/drawer_icons/instructor_home-sltd.png'
    //                   : 'assets/icons/drawer_icons/instructor_home.png',
    //               height: 25,
    //               fit: BoxFit.contain,
    //             ), //const Icon(Icons.apps),
    //             title: const Text(
    //               'Home',
    //             ),
    //             activeColor: primaryColor,
    //           ),
    //           BottomNavyBarItem(
    //             icon: Image.asset(
    //               _selectedIndex == 1
    //                   ? 'assets/icons/drawer_icons/my-course-sltd.png'
    //                   : 'assets/icons/drawer_icons/my-course.png',
    //               height: 30,
    //               fit: BoxFit.contain,
    //             ),
    //             title: const Text(
    //               'My Courses',
    //             ),
    //             activeColor: primaryColor,
    //           ),
    //           BottomNavyBarItem(
    //             icon: Image.asset(
    //               _selectedIndex == 2
    //                   ? 'assets/icons/drawer_icons/library-sltd.png'
    //                   : 'assets/icons/drawer_icons/library.png',
    //               height: 25,
    //               fit: BoxFit.contain,
    //             ),
    //             title: const Text(
    //               'Library',
    //             ),
    //             activeColor: primaryColor,
    //           ),
    //           BottomNavyBarItem(
    //             icon: Image.asset(
    //               _selectedIndex == 3
    //                   ? 'assets/icons/drawer_icons/instructor_profile-sltd.png'
    //                   : 'assets/icons/drawer_icons/instructor_profile.png',
    //               height: 30,
    //               fit: BoxFit.contain,
    //             ),
    //             title: const Text(
    //               'My Profile',
    //             ),
    //             activeColor: primaryColor,
    //           ),
    //         ]),
    //   ),
    // );
  }
}
