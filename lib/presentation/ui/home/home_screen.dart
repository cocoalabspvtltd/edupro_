import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:pgs_edupro/application/ads/ads_bloc.dart';
import 'package:pgs_edupro/application/course/courses_bloc.dart';
import 'package:pgs_edupro/application/payment/payment_bloc.dart';
import 'package:pgs_edupro/application/profile/profile_bloc.dart';
import 'package:pgs_edupro/application/video/top_videos/top_videos_bloc.dart';
import 'package:pgs_edupro/application/video/trending_videos/trending_videos_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/shared_prefs.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/ads/ads_repository.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/course/course_repository.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/payment/payment_repository.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/profile/profile_repository.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/videos/video_repository.dart';
import 'package:pgs_edupro/presentation/ui/course/my_course_screen.dart';
import 'package:pgs_edupro/presentation/ui/home/widgets/drawer.dart';
import 'package:pgs_edupro/presentation/ui/home/widgets/home_body.dart';
import 'package:pgs_edupro/presentation/ui/home/widgets/menu_button.dart';
import 'package:pgs_edupro/presentation/ui/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  final int selectedIndex;
  const HomeScreen({super.key, this.selectedIndex = 0});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? currentBackPressTime;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  int? daysRemaining;

  late int _selectedIndex;
  late PageController _pageController;
  List title = ['Home', 'My Courses', 'Library', 'My Profile'];

  @override
  void initState() {
    super.initState();

    daysRemaining = int.parse(SharedPrefs.getString('spSuscriptionPeriod'));
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
        BlocProvider(
          create: (_) => PaymentBloc(PaymentRepository()),
        ),
        BlocProvider(
          create: (_) => TrendingVideosBloc(VideoRepository())
            ..add(const TrendingVideosEvent.loadVideos()),
        ),
        BlocProvider(
          create: (_) => TopVideosBloc(VideoRepository())
            ..add(const TopVideosEvent.loadVideos()),
        ),
        BlocProvider(
          create: (_) => CoursesBloc(CourseRepository())
            ..add(const CoursesEvent.loadCourseCategories()),
        ),
        BlocProvider(
            create: (_) => ProfileBloc(ProfileRepository())
              ..add(ProfileEvent.loadMyProfile(
                  int.parse(UserDetailsLocal.userId)))),
        BlocProvider(
            create: (_) =>
                AdsBloc(AdsRepository())..add(const AdsEvent.getAds())),
      ],
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
            title[_selectedIndex],
            style: appBarText,
          ),
          leading: MenuSwitch(_scaffoldKey),
          leadingWidth: 38,
        ),
        drawer: DrawerWidget(
          context: context,
          scaffoldKey: _scaffoldKey,
        ),
        body: WillPopScope(
          onWillPop: () {
            DateTime now = DateTime.now();
            if (currentBackPressTime == null ||
                now.difference(currentBackPressTime!) >
                    const Duration(seconds: 2)) {
              currentBackPressTime = now;
              Fluttertoast.showToast(msg: 'Please press back again to exit');
              return Future.value(false);
            }
            return Future.value(true);
          },
          child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _selectedIndex = index);
              },
              children: [
                ((daysRemaining ?? 0) <= 0) ? _renewSuscription() : HomeBody(),
                ((daysRemaining ?? 0) <= 0)
                    ? _renewSuscription()
                    : const MyCourseScreen(),
                ((daysRemaining ?? 0) <= 0) ? _renewSuscription() : HomeBody(),
                const ProfileScreen()
              ]),
        ),
        bottomNavigationBar: BottomNavyBar(
            backgroundColor: primaryColor[50],
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
                icon: Image.asset(
                  _selectedIndex == 0
                      ? 'assets/icons/drawer_icons/home-sltd.png'
                      : 'assets/icons/drawer_icons/home.png',
                  height: 25,
                  fit: BoxFit.contain,
                ), //const Icon(Icons.apps),
                title: const Text(
                  'Home',
                ),
                activeColor: primaryColor,
              ),
              BottomNavyBarItem(
                icon: Image.asset(
                  _selectedIndex == 1
                      ? 'assets/icons/drawer_icons/my-course-sltd.png'
                      : 'assets/icons/drawer_icons/my-course.png',
                  height: 30,
                  fit: BoxFit.contain,
                ),
                title: const Text(
                  'My Courses',
                ),
                activeColor: primaryColor,
              ),
              BottomNavyBarItem(
                icon: Image.asset(
                  _selectedIndex == 2
                      ? 'assets/icons/drawer_icons/library-sltd.png'
                      : 'assets/icons/drawer_icons/library.png',
                  height: 25,
                  fit: BoxFit.contain,
                ),
                title: const Text(
                  'Library',
                ),
                activeColor: primaryColor,
              ),
              BottomNavyBarItem(
                icon: Image.asset(
                  _selectedIndex == 3
                      ? 'assets/icons/drawer_icons/profile-sltd.png'
                      : 'assets/icons/drawer_icons/profile.png',
                  height: 30,
                  fit: BoxFit.contain,
                ),
                title: const Text(
                  'My Profile',
                ),
                activeColor: primaryColor,
              ),
            ]),
      ),
    );
  }

  Widget _renewSuscription() {
    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Suscription Ended.. \n Please Recharge to continue use all the features',
                style: boldValue,
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String paymentType = 'REGISTRATION';
                context.read<PaymentBloc>().add(
                      PaymentEvent.startPayment(
                        '1500',
                        paymentType,
                      ),
                    );
              },
              child: const Text("Pay Now"),
            )
          ],
        );
      },
    );
  }
}
