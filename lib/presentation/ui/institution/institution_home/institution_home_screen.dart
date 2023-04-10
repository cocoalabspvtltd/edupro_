import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgs_edupro/application/ads/ads_bloc.dart';
import 'package:pgs_edupro/application/course/courses_bloc.dart';
import 'package:pgs_edupro/application/video/top_videos/top_videos_bloc.dart';
import 'package:pgs_edupro/application/video/trending_videos/trending_videos_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/ads/ads_repository.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/course/course_repository.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/videos/video_repository.dart';
import 'package:pgs_edupro/presentation/ui/institution/institution_home/widgets/insitution_drawer.dart';
import 'package:pgs_edupro/presentation/ui/institution/institution_home/widgets/insitution_home_body.dart';
import 'package:pgs_edupro/presentation/ui/institution/institution_home/widgets/institution_menu_button.dart';
import 'package:pgs_edupro/presentation/ui/profile/profile_screen.dart';


class InstitutionHomeScreen extends StatefulWidget {
  final int selectedIndex;
  const InstitutionHomeScreen({super.key, this.selectedIndex = 0});

  @override
  State<InstitutionHomeScreen> createState() => _InstitutionHomeScreenState();
}

class _InstitutionHomeScreenState extends State<InstitutionHomeScreen> {
  DateTime? currentBackPressTime;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late int _selectedIndex;
  late PageController _pageController;
  List title = ['Home', 'My Courses', 'My Profile'];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _selectedIndex = widget.selectedIndex;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _pageController.animateToPage(_selectedIndex,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //     create: (_) => ProfileBloc(ProfileRepository())
        //       ..add(ProfileEvent.loadMyProfile(
        //           int.parse(UserDetailsLocal.userId)))),
        BlocProvider(
          create: (_) => CoursesBloc(CourseRepository())
            ..add(const CoursesEvent.loadCourseCategories()),
        ),
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
          leading: InstitutionMenuSwitch(_scaffoldKey),
          leadingWidth: 38,
        ),
        drawer: InstitutionDrawerWidget(
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
            child:  PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _selectedIndex = index);
                },
                children:[
                  InstitutionHomeBody(),
                  Text("Course"),
                  ProfileScreen(),
                ]
            ),
            // _selectedIndex == 3
            //     ? Text("Profile")
            //     :_selectedIndex == 2
            //     ? Text("Library")
            //     : _selectedIndex == 1
            //     ? Text("Course")
            //     : _selectedIndex == 0
            //     ? InstitutionHomeBody()
            //     : Center(child: Text("hai"))
        ),
        bottomNavigationBar: BottomNavyBar(
            backgroundColor: Colors.black,
            //containerHeight: 60,
            selectedIndex: _selectedIndex,
            showElevation: false, // use this to remove appBar's elevation
            itemCornerRadius: 6,
            onItemSelected: (index) => setState(() {
              _selectedIndex = index;
              _pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease);
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
                icon:  _selectedIndex == 2 ?Image.asset('assets/icons/drawer_icons/profile-sltd.png',
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
  }
}
