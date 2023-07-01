import 'package:pgs_edupro/application/course/courses_bloc.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/course/course_repository.dart';
import 'package:pgs_edupro/presentation/ui/course/widgets/course_report_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseReportScreen extends StatelessWidget {
  final bool fromHome;
  const CourseReportScreen({super.key, this.fromHome = true});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CoursesBloc(CourseRepository()),
        child: const CourseReportWidget());
  }
}
