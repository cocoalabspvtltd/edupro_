import 'package:pgs_edupro/application/payment/payment_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/course/course_in_category_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/payment/payment_repository.dart';
import 'package:pgs_edupro/presentation/ui/course/widgets/course_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseDetailsScreen extends StatelessWidget {
  final CourseList courseDetails;
  const CourseDetailsScreen({super.key, required this.courseDetails});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PaymentBloc(PaymentRepository()),
      child: Scaffold(
        appBar:appBarTheme("About this course"),
        body: CourseDetailsView(courseList: courseDetails),
      ),
    );
  }
}
