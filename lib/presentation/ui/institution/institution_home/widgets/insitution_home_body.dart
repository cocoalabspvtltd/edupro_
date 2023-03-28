import 'package:pgs_edupro/application/ads/ads_bloc.dart';
import 'package:pgs_edupro/application/course/courses_bloc.dart';
import 'package:pgs_edupro/application/video/top_videos/top_videos_bloc.dart';
import 'package:pgs_edupro/application/video/trending_videos/trending_videos_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/presentation/ui/course/course_catogories_screen.dart';
import 'package:pgs_edupro/presentation/ui/home/ads_screen.dart';
import 'package:pgs_edupro/presentation/ui/videos/top_videos_screen.dart';
import 'package:pgs_edupro/presentation/ui/videos/trending_videos_screen.dart';

class InstitutionHomeBody extends StatelessWidget {
  InstitutionHomeBody({super.key});

  List<String> titile = ["Code", "Courses", 'Instructors', "Students"];
  List<String> count = ["Code", "40", '30', "50"];
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
        BlocProvider.of<TopVideosBloc>(context)
            .add(const TopVideosEvent.loadVideos());
        context
            .read<TrendingVideosBloc>()
            .add(const TrendingVideosEvent.loadVideos());
        context
            .read<CoursesBloc>()
            .add(const CoursesEvent.loadCourseCategories());
        context.read<AdsBloc>().add(const AdsEvent.getAds());
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
              thickSpace,
              Container(
                  height: screenHeight * 0.18,
                  width: screenWidth * 0.95,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: GridView.builder(
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1.2 / 0.4),
                          itemCount: titile.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height:screenHeight * 0.2 ,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: primaryColor,
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: screenWidth * 0.07,),
                                  Text(titile[index],style: TextStyle(color: Colors.grey[800],fontSize: 18),),
                                  Spacer(),
                                  Text(count[index],style: TextStyle(color: Colors.grey[800]),),
                                  SizedBox(width: screenWidth * 0.08,)
                                ],
                              ),
                            );
                          }))),
              CourseCategoriesScreen(
                key: key,
              ),
              thickSpace,
              TrendingVideosScreen(
                key: key,
              ),
              thickSpace,
              TopVideosScreen(
                key: key,
              ),
              thickSpace,
            ],
          ),
        ),
      ),
    );
  }
}
