import 'package:dartz/dartz.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/course/course_categories_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/course/course_in_category_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/course/course_report_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/insistution/class_list_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/insistution/count.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/insistution/insistutionResponse.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/my_course/my_courses_response.dart';

import '../../infrastructure/remote_data/models/insistution/deletion_response.dart';

abstract class ICourseRepository {
  Future<Either<NetworkFailure, CourseCategoriesResponse>>
      getCourseCategories();
  Future<Either<NetworkFailure, CourseInCategoryResponse>> getCoursesInCategory(
      String userId, String categoryName);
  Future<Either<NetworkFailure, MyCoursesResponse>> getMyCourse(String userId);
  Future<Either<NetworkFailure, InstructorCourseListResponse>> getInstructor(String userId);
  Future<Either<NetworkFailure, MyCoursesResponse>> getPurchasedCourses(String userId);
  Future<Either<NetworkFailure, MyCourseReportResponse>> getCourseReport(Map data);
  Future<Either<NetworkFailure, CountResponse>> getCountCourses(String userId);
  Future<Either<NetworkFailure, InsistutionResponse>> getInsistutionCategories(String userId);
  Future<Either<NetworkFailure, ClassListResponse>> getClassList(String userId);
  Future<Either<NetworkFailure, DeletionResponse>> getDeletion();
  Future<Either<NetworkFailure, DeletionResponse>> classDeletion();
}
