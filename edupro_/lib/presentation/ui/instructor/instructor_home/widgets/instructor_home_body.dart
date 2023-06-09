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

class IstructorHomeBody extends StatelessWidget {
  IstructorHomeBody({super.key});

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
              Padding(
                padding: const EdgeInsets.only(top: 38.0, left: 15, right: 15),
                child: SizedBox(
                  width: screenWidth,
                  child: Container(
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: [
                          Colors.orangeAccent,
                          Colors.orange,
                          Colors.purple,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello ${UserDetailsLocal.userName} ",
                            style: TextStyle(
                                fontSize: 21,
                                color: Colors.white,
                                fontFamily: "Pacifico",
                                fontWeight: FontWeight.normal),
                          ),
                          thickSpace,
                          Text(
                            'Nice to have back,What an exciting day ! \nget ready and Continue your lessons today',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontFamily: "Pacifico",
                                fontWeight: FontWeight.normal),
                          ),
                          thickSpace,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16,),
              AdsScreen(
                key: key,
              ),

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
