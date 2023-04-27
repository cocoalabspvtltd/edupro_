import 'package:cached_network_image/cached_network_image.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/shared_prefs.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/presentation/ui/bid_products/bid_product_list.dart';
import 'package:pgs_edupro/presentation/ui/bid_products/products_screen.dart';
import 'package:pgs_edupro/presentation/ui/course/course_report_screen.dart';
import 'package:pgs_edupro/presentation/ui/home/home_screen.dart';
import 'package:pgs_edupro/presentation/ui/membership/membership_screen.dart';
import 'package:pgs_edupro/presentation/ui/offers/hotel_list_screen.dart';
import 'package:pgs_edupro/presentation/ui/videos/live_videos_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatelessWidget {
  final BuildContext context;
  final GlobalKey<ScaffoldState> scaffoldKey;
  const DrawerWidget(
      {super.key, required this.context, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return _drawer();
  }

  Widget _drawer() {
    return SafeArea(
      child: Drawer(
        elevation: 0,
        shape: const RoundedRectangleBorder(),
        backgroundColor: Colors.orangeAccent,
        width: screenWidth - (screenWidth / 5),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Material(
              child: SafeArea(
                child: InkWell(
                  onTap: () {
                    scaffoldKey.currentState!.openEndDrawer();
                  },
                  child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.purple, Colors.orangeAccent, Colors.orange]
                        ),
                      ),
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: Row(mainAxisSize: MainAxisSize.max, children: [
                        InkWell(
                          onTap: () {
                            Get.offAll(() => const HomeScreen(
                              selectedIndex: 3,
                            ));
                          },
                          child: Container(
                              width: screenWidth * .14,
                              height: screenWidth * .14,
                              padding: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: UserDetailsLocal.storageBaseUrl +
                                      UserDetailsLocal.userImageUrl,
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
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover)),
                                      ),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                        width: screenWidth * .14,
                                        height: screenWidth * .14,
                                        padding: const EdgeInsets.all(5),
                                        child: const Image(
                                          image: AssetImage(
                                              'assets/icons/drawer_icons/display-picture-sltd.png'),
                                          height: double.infinity,
                                          width: double.infinity,
                                        ),
                                      ),
                                ),
                              )),
                        ),
                        const SizedBox(width: 22),
                        const SizedBox(height: 17),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(height: 50),
                                Text(
                                  UserDetailsLocal.userName,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Sigmar",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  UserDetailsLocal.userEmail,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Sigmar",
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )),
                        Icon(
                          Icons.close,
                          color: Colors.white,
                        )
                      ])),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white, //secondaryColor[100],
                padding: const EdgeInsets.all(2),
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    SizedBox(height: 10,),
                    _drawerMenuItem(
                        Image.asset(
                            'assets/icons/drawer_icons/my-course-sltd.png'),
                        'Live Sessions', () {
                      Get.to(() => const LiveVideosScreen(
                        fromHome: false,
                      ));
                    }),
                    SizedBox(height: 10,),
                    _drawerMenuItem(
                        Image.asset(
                            'assets/icons/drawer_icons/my-course-sltd.png'),
                        'My Courses', () {
                      Get.offAll(() => const HomeScreen(
                        selectedIndex: 1,
                      ));
                    }),
                    SizedBox(height: 10,),
                    _drawerMenuItem(
                        Image.asset(
                            'assets/icons/drawer_icons/library-sltd.png'),
                        'Library', () {
                      Get.offAll(() => const HomeScreen(
                        selectedIndex: 2,
                      ));
                    }),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left:0.0005),
                      child: ExpansionTile(
                        title: Text(
                          "Hospitallity Offers",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        leading: Container(
                          height: 38,
                          width: 38.0,
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 2, color: primaryColor),
                            color: primaryColor[50],
                          ),
                          child: Image.asset(
                              'assets/icons/drawer_icons/my-course-sltd.png'),
                        ),
                        childrenPadding: EdgeInsets.only(left: 50), //children padding
                        children: [
                          _drawerMenuItem1('My Offers', () {
                            Get.to(() => HotellistScreen());
                          }),
                          _drawerMenuItem1('Purchased List', () {
                            // Get.to(() => AddInstructorScreen());
                          }),
                          //more child menu
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    _drawerMenuItem(
                        Image.asset(
                            'assets/icons/drawer_icons/my-course-sltd.png'),
                        'Auction', () {
                      Get.to(() =>  ProductsScreen(fragmentToShow: 0,));
                      // const BidProductlistScreen(
                      //   fromHome: false,
                      // ));
                    }),
                    SizedBox(height: 10,),
                    _drawerMenuItem(
                        Image.asset(
                            'assets/icons/drawer_icons/profile-sltd.png'),
                        'Membership', () {
                      Get.to(() => const MembershipScreen());
                    }),
                    SizedBox(height: 10,),
                    _drawerMenuItem(
                        Image.asset(
                            'assets/icons/drawer_icons/report-sltd.png'),
                        'Report', () {
                      Get.to(() => const CourseReportScreen());
                    }),
                    // SizedBox(height: 10,),
                    // _drawerMenuItem(
                    //     Image.asset('assets/icons/drawer_icons/report.png'),
                    //     'Privacy Policy',
                    //         () {}),
                    // SizedBox(height: 10,),
                    // _drawerMenuItem(
                    //     Image.asset('assets/icons/drawer_icons/report.png'),
                    //     'Terms and Conditions',
                    //         () {}),
                  ],
                ),
              ),
            ),
            // Spacer(),
            InkWell(
                child: Center(
                  child: Container(
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                  begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [ Colors.orangeAccent, Colors.orange]
                  ),
                ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.logout,
                              size: 30,
                              color: secondaryColor[50],
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                                child: Text(
                                  'Logout',
                                  style: TextStyle(
                                      color: secondaryColor[50],
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ))
                          ]),
                    ),
                  ),
                ),
                onTap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: const Text(
                          'Are you sure want to log out?',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        actions: [
                          OutlinedButton(
                            child: const Text('No'),
                            onPressed: () {
                              Navigator.pop(context);

                              Get.back();
                            },
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          ElevatedButton(
                            child: const Text('Yes'),
                            onPressed: () {
                              Navigator.pop(context);
                              SharedPrefs.logOut();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }

  Widget _drawerMenuItem(Widget widget, String title, Function onTap) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Material(
        color: secondaryColor[100],
        child: InkWell(
            child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: .2),
                      borderRadius: BorderRadius.circular(0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(children: [
                      Container(
                        height: 38,
                        width: 38.0,
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: primaryColor),
                          color: primaryColor[50],
                        ),
                        child: widget,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                          child: Text(
                            title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ))
                    ]),
                  ),
                )),
            onTap: () {
              scaffoldKey.currentState!.openEndDrawer();
              onTap();
            }),
      ),
    );
  }

  Widget _drawerMenuItem1(String title, Function onTap) {
    return Material(
      color: secondaryColor[100],
      child: InkWell(
          child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white!, width: .2),
                    borderRadius: BorderRadius.circular(0)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Text(
                              title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ))
                      ]),
                ),
              )),
          onTap: () {
            scaffoldKey.currentState!.openEndDrawer();
            onTap();
          }),
    );
  }
}
