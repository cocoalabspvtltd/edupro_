import 'package:pgs_edupro/application/Hotel/hotel_list_bloc.dart';
import 'package:pgs_edupro/application/ads/ads_bloc.dart';
import 'package:pgs_edupro/application/course/courses_bloc.dart';
import 'package:pgs_edupro/application/video/top_videos/top_videos_bloc.dart';
import 'package:pgs_edupro/application/video/trending_videos/trending_videos_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/presentation/ui/course/course_catogories_screen.dart';
import 'package:pgs_edupro/presentation/ui/home/ads_screen.dart';
import 'package:pgs_edupro/presentation/ui/offers/home_hotel_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
  HomeBody({super.key});

  final colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
    Colors.green,
  ];

  final colorizeTextStyle = const TextStyle(
    fontSize: 14.0,
    fontFamily: 'Horizon',
  );

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        //context.read<MembershipBloc>().add(const MembershipEvent.loadData());
        BlocProvider.of<TopVideosBloc>(context)
            .add(const TopVideosEvent.loadVideos());
        context
            .read<TrendingVideosBloc>()
            .add(const TrendingVideosEvent.loadVideos());
        context
            .read<CoursesBloc>()
            .add(const CoursesEvent.loadCourseCategories());
        context.read<AdsBloc>().add(const AdsEvent.getAds());
        context
            .read<HotelListBloc>()
            .add(const HotelListEvent.LoadHotels());
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              AdsScreen(
                key: key,
              ),
             Container(child: Image.asset("assets/images/homes/bid.jpg"),),
              //thickSpace,
              // Text(
              //   " Continue Learning..",
              //   style: boldWord,
              // ),
              //thickSpace,
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     children: [
              //       Container(
              //         width: screenWidth / 2 - 8,
              //         height: screenWidth / 2,
              //         decoration: BoxDecoration(
              //           border: Border.all(
              //             color: Colors.black54,
              //           ),
              //         ),
              //         child: Center(
              //           child: Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Text(
              //               "session to show currently learning courses so user can continue from the last session",
              //               textAlign: TextAlign.justify,
              //               style: boldValuePrimaryColor,
              //             ),
              //           ),
              //         ),
              //       ),
              //       Container(
              //         width: screenWidth / 2 - 8,
              //         height: screenWidth / 2,
              //         decoration: BoxDecoration(
              //           border: Border.all(
              //             color: Colors.black54,
              //           ),
              //         ),
              //         child: Center(
              //           child: Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Text(
              //               "session to show currently learning courses so user can continue from the last session",
              //               textAlign: TextAlign.justify,
              //               style: boldValuePrimaryColor,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // thickSpace,
              // thickSpace,
              // Text(
              //   " Recommended Courses..",
              //   style: boldWord,
              // ),
              // thickSpace,
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     children: [
              //       Container(
              //         width: screenWidth / 2 - 8,
              //         height: screenWidth / 2,
              //         decoration: BoxDecoration(
              //           border: Border.all(
              //             color: Colors.black54,
              //           ),
              //         ),
              //         child: Center(
              //           child: Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Text(
              //               "session to show recommended courses so user can purchase interested course with less effort as well as can advertise the course",
              //               textAlign: TextAlign.justify,
              //               style: boldValuePrimaryColor,
              //             ),
              //           ),
              //         ),
              //       ),
              //       Container(
              //         width: screenWidth / 2 - 8,
              //         height: screenWidth / 2,
              //         decoration: BoxDecoration(
              //           border: Border.all(
              //             color: Colors.black54,
              //           ),
              //         ),
              //         child: Center(
              //           child: Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Text(
              //               "session to show recommended courses so user can purchase interested course with less effort as well as can advertise the course",
              //               textAlign: TextAlign.justify,
              //               style: boldValuePrimaryColor,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // thickSpace,
              // thickSpace,
              // Padding(
              //   padding: const EdgeInsets.only(left: 8.0, right: 8),
              //   child: SizedBox(
              //     height: 14,
              //     width: screenWidth,
              //     child: DefaultTextStyle(
              //       style: const TextStyle(
              //         fontSize: 14.0,
              //         fontWeight: FontWeight.bold,
              //         color: Colors.green,
              //         fontFamily: 'Agne',
              //       ),
              //       child: AnimatedTextKit(
              //         animatedTexts: [
              //           FlickerAnimatedText('Upcoming Live Sessions..'),
              //           // TypewriterAnimatedText(
              //           //     'The Complete Actor Mohanlal talking about edupro application is streaming live a  11 AM today, Dont forget to check out the live session at 11 AM'),
              //           // TyperAnimatedText('It is not enough to do your best,'),
              //         ],
              //         isRepeatingAnimation: true,
              //         repeatForever: true,
              //         onTap: () {
              //           launchUrlString('https://www.google.com');
              //         },
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: SizedBox(
              //     width: screenWidth,
              //     child: DefaultTextStyle(
              //       style: const TextStyle(
              //         fontWeight: FontWeight.bold,
              //         color: Colors.green,
              //         fontFamily: 'Agne',
              //       ),
              //       child: AnimatedTextKit(
              //         pause: Duration(milliseconds: 2),
              //         animatedTexts: [
              //           ColorizeAnimatedText(
              //             ' Honourable  Prime Minister of India inauguration event of edupro application is streaming live a  12 AM today, Dont miss to check out the live session at 12 AM',
              //             textStyle: colorizeTextStyle,
              //             colors: colorizeColors,
              //           ),
              //           ColorizeAnimatedText(
              //             ' The Complete Actor Mohanlal talking about edupro application is streaming live a  11 AM today, Dont miss to check out the live session at 11 AM',
              //             textStyle: colorizeTextStyle,
              //             colors: colorizeColors,
              //           ),
              //         ],
              //         isRepeatingAnimation: true,
              //         repeatForever: true,
              //         onTap: () {
              //           launchUrlString('https://www.google.com');
              //         },
              //       ),
              //     ),
              //   ),
              // ),
              // thickSpace,
              // thickSpaceLogin,
              // CourseCategoriesScreen(
              //   key: key,
              // ),
              thickSpaceLogin,
              thickSpace,

            ],
          ),
        ),
      ),
    );
  }
}
