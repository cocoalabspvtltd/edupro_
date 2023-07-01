import 'dart:async';
import 'dart:convert';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pgs_edupro/application/Hotel/hotel_list_bloc.dart';
import 'package:pgs_edupro/application/ads/ads_bloc.dart';
import 'package:pgs_edupro/application/course/courses_bloc.dart';
import 'package:pgs_edupro/application/payment/payment_bloc.dart';
import 'package:pgs_edupro/application/video/top_videos/top_videos_bloc.dart';
import 'package:pgs_edupro/application/video/trending_videos/trending_videos_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/domain/core/network/api_provider.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/shared_prefs.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/ads/ads_repository.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/course/course_repository.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/offers/offers_repository.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/payment/payment_repository.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/videos/video_repository.dart';
import 'package:pgs_edupro/presentation/ui/bid_products/products_screen.dart';
import 'package:pgs_edupro/presentation/ui/course/my_course_screen.dart';
import 'package:pgs_edupro/presentation/ui/home/widgets/drawer.dart';
import 'package:pgs_edupro/presentation/ui/home/widgets/home_body.dart';
import 'package:pgs_edupro/presentation/ui/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  final int selectedIndex;
  const HomeScreen({super.key, this.selectedIndex = 0});



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? currentBackPressTime;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  Map SplashResponse = {};
  late List<dynamic> splash;
  ApiProvider? apiprovider;
  Future getAds() async {
    print("Get order");
    http.Response response = await http.get(
      Uri.parse('https://pgsedu.com/EduPro/index.php/api/screen-list'),
      headers: <String, String>{
        'Accept': "appilication/json",
        'Authorization': 'Bearer ${UserDetailsLocal.apiToken}',
      },
    );
    print("Responsekjhkh${response.body}");
    var jsonData = json.decode(response.body);
    SplashResponse = jsonData;
    splash=SplashResponse['screen_list'];
    print("hkjhkhkj${splash}");
    if (response.statusCode == 200) {
      showAlert(splash);
    }
    return response;
  }

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
      Future(getAds);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration.zero, () => showAlert(context));
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
          create: (_) => HotelListBloc(OffersRepository())
            ..add(const HotelListEvent.LoadHotels()),
        ),
        // BlocProvider(
        //     create: (_) => ProfileBloc(ProfileRepository())
        //       ..add(ProfileEvent.loadMyProfile(
        //           int.parse(UserDetailsLocal.userId)))),
        BlocProvider(
            create: (_) =>
                AdsBloc(AdsRepository())..add(const AdsEvent.getAds())),
      ],
      child: Scaffold(
        key: _scaffoldKey,
        appBar: appBarTheme("${title[_selectedIndex]}"),
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
        bottomNavigationBar: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Colors.orange,
                      Color(0xFFB226B2),
                    ]),
              ),
              // i have found out the height of the bottom navigation bar is roughly 60
              height: 60,
            ),
            BottomNavyBar(
                backgroundColor: Colors.transparent,
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
                            color: Colors.white,
                          )
                        : Image.asset(
                            'assets/icons/drawer_icons/home.png',
                            height: 25,
                            fit: BoxFit.contain,
                          ), //const Icon(Icons.apps),
                    title: const Text(
                      'Home',
                    ),
                    activeColor: Colors.white,
                  ),
                  BottomNavyBarItem(
                    icon: _selectedIndex == 1
                        ? Image.asset(
                            'assets/icons/drawer_icons/my-course-sltd.png',
                            height: 30,
                            fit: BoxFit.contain,
                            color: Colors.white,
                          )
                        : Image.asset(
                            'assets/icons/drawer_icons/my-course.png',
                            height: 30,
                            fit: BoxFit.contain,
                          ),
                    title: const Text(
                      'My Courses',
                    ),
                    activeColor: Colors.white,
                  ),
                  BottomNavyBarItem(
                    icon: _selectedIndex == 2
                        ? Image.asset(
                            'assets/icons/drawer_icons/library-sltd.png',
                            height: 25,
                            fit: BoxFit.contain,
                            color: Colors.white,
                          )
                        : Image.asset(
                            'assets/icons/drawer_icons/library.png',
                            height: 25,
                            fit: BoxFit.contain,
                          ),
                    title: const Text(
                      'Library',
                    ),
                    activeColor: Colors.white,
                  ),
                  BottomNavyBarItem(
                    icon: _selectedIndex == 3
                        ? Image.asset(
                      'assets/icons/drawer_icons/profile-sltd.png',
                            height: 30,
                            fit: BoxFit.contain,
                      color: Colors.white,
                          )
                        : Image.asset(
                      'assets/icons/drawer_icons/profile.png',
                            height: 30,
                            fit: BoxFit.contain,
                          ),
                    title: const Text(
                      'My Profile',
                    ),
                    activeColor: Colors.white,
                  ),
                ]),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: showHelpDesk(),
        ),
      ),
    );
  }



  void showAlert(List splash) {
    showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              backgroundColor: Colors.white70,
              content: Container(
                height: screenHeight * 0.7,
                width: screenWidth * 0.8,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child:CarouselSlider.builder(
                          itemCount: splash.length,
                          options: CarouselOptions(
                            autoPlay: true,
                            aspectRatio: 1 / (5 / 3),
                            enableInfiniteScroll: false,
                            enlargeCenterPage: true,
                              viewportFraction: 1
                          ),
                          itemBuilder: (context, index, realIdx) {
                            return CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: UserDetailsLocal
                                  .storageBaseUrl +
                                  '${splash[index]["image"]}',
                              placeholder:
                                  (context, url) =>
                                  Center(
                                    child:
                                    CircularProgressIndicator(),
                                  ),
                              errorWidget:
                                  (context, url, error) =>
                                  ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(
                                        12),
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/dp.png'),
                                      // height: 60,
                                      // width: 60,
                                    ),
                                  ),
                            );
                          }),
                    ),
                    Positioned(
                      right: 10,
                      top: 5,
                      child:  IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.close,color: Colors.white,)
                      ),
                    ),
                    Positioned(
                      left: 25,
                      right: 25,
                      bottom: 5,
                      child:  ElevatedButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                        onPressed: () {
                          Navigator.pop(context);
                          Get.to(() =>  const ProductScreen(
                          ));
                        },
                        child: Padding(
                          padding:
                          const EdgeInsets.all(4),
                          child: Text('JOIN NOW'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              contentPadding: EdgeInsets.zero,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            ));

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
showHelpDesk() {
  return FloatingActionButton(
    backgroundColor: Colors.white,
    child: Icon(Icons.headset_mic_rounded, color: Color(0xFFB226B2),),
    onPressed: () async {
      var whatsAppUrl = "whatsapp://send?phone=+917560911122";
      await launch(whatsAppUrl)
          ? launch(whatsAppUrl)
          : Get.snackbar("Oops!!", "Check whatsapp is installed or not",
          backgroundColor: Colors.deepPurple,
          // snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          shouldIconPulse: true,
          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
          icon: Icon(
            Icons.search,
            color:Colors.deepPurple,
          ));
    },
  );
}
