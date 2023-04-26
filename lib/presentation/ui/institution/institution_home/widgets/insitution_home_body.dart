import 'dart:convert';
import 'dart:developer';

import 'package:pgs_edupro/application/Insistution_student_course_instructor/all_categories_bloc.dart';
import 'package:pgs_edupro/application/ads/ads_bloc.dart';
import 'package:pgs_edupro/application/course/courses_bloc.dart';
import 'package:pgs_edupro/application/insistution_count/insistution_bloc.dart';
import 'package:pgs_edupro/application/video/top_videos/top_videos_bloc.dart';
import 'package:pgs_edupro/application/video/trending_videos/trending_videos_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/presentation/ui/videos/top_videos_screen.dart';
import 'package:pgs_edupro/presentation/ui/videos/trending_videos_screen.dart';
import 'countscreen.dart';

class InstitutionHomeBody extends StatelessWidget {
  InstitutionHomeBody({super.key});

  List<String> titile = ["Code", "Courses", 'Instructors', "Students"];
  List images = [
    "assets/images/home/institute.jpg",
    "assets/images/home/course.png",
    "assets/images/home/instructor.png",
    "assets/images/home/students.png"
  ];

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
            .read<InsistutionBloc>()
            .add(const InsistutionEvent.loadMyCourses());
        context
            .read<AllCategoriesBloc>()
            .add(const AllCategoriesEvent.loadMyCourses());
        context
            .read<CoursesBloc>()
            .add(const CoursesEvent.loadCourseCategories());
        context.read<AdsBloc>().add(const AdsEvent.getAds());
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              thickSpace,
              ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: [Colors.orange, Colors.purple],
                ).createShader(bounds),
                child: Text(
                  "Welcome !!\n ${UserDetailsLocal.userName} ",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Pacifico",
                  ),
                )
              ),
              thickSpace,
              thickSpace,
              CourtScreen(),
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
