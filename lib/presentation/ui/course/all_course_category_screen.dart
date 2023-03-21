import 'package:pgs_edupro/application/course/courses_bloc.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/course/course_repository.dart';
import 'package:pgs_edupro/presentation/ui/course/course_catogories_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeAllCourseCategory extends StatelessWidget {
  const SeeAllCourseCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CoursesBloc(CourseRepository())
        ..add(const CoursesEvent.loadCourseCategories()),
      child: Scaffold(
          appBar: AppBar(title: const Text("Course Category")),
          body: const CourseCategoriesScreen(
            fromHome: false,
          )),
    );
  }
}
