import 'package:dartz/dartz.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/course/course_categories_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/course/course_in_category_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/course/course_report_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/my_course/my_courses_response.dart';

abstract class ICourseRepository {
  Future<Either<NetworkFailure, CourseCategoriesResponse>>
      getCourseCategories();
  Future<Either<NetworkFailure, CourseInCategoryResponse>> getCoursesInCategory(
      String userId, String categoryName);
  Future<Either<NetworkFailure, MyCoursesResponse>> getMyCourse(String userId);
  Future<Either<NetworkFailure, MyCourseReportResponse>> getCourseReport(
      Map data);
}
