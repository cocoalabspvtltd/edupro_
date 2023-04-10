import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pgs_edupro/domain/course/i_course_repository.dart';
import 'package:pgs_edupro/domain/core/network/api_provider.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/course/course_categories_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/course/course_in_category_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/course/course_report_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/my_course/addcourses.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/my_course/my_courses_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/source/api.dart';


class CourseRepository implements ICourseRepository {
  ApiProvider? apiClient;

  CourseRepository() {
    apiClient ??= ApiProvider();
  }

  @override
  Future<Either<NetworkFailure, CourseCategoriesResponse>>
      getCourseCategories() async {
    try {
      Response response =
          await apiClient!.getJsonInstance().get(Api.getCourseCategories);
      //Category = response.data;
//log("list->${Category}");
      return right(CourseCategoriesResponse.fromJson(response.data));
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 401) {
          return left(
              NetworkFailure.unAuthorized(e.response!.data["message"] ?? ''));
        }
        return left(NetworkFailure.serverError(
            "Status Code ${e.response!.statusCode}"));
      } else if (e.toString().contains('Connecting timed out')) {
        return left(const NetworkFailure.serverTimeOut());
      }
      return left(const NetworkFailure.unexpected());
    } catch (e) {
      return left(const NetworkFailure.unexpected());
    }
  }

  @override
  Future<Either<NetworkFailure, CourseInCategoryResponse>> getCoursesInCategory(
      String userId, String categoryName,) async {
    try {
      Response response = await apiClient!.getJsonInstance().post(
          Api.getCoursesInCategory,
          data: {'category': categoryName, 'user_id': userId});
      print("body-0>${response.data["course_list"][0]["about_course"]}");
      // var doc = parse(response.data["course_list"][0]["about_course"]);
      // print("doc-0>${doc.documentElement?.text}");
      return right(CourseInCategoryResponse.fromJson(response.data));
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 401) {
          return left(
              NetworkFailure.unAuthorized(e.response!.data["message"] ?? ''));
        }
        return left(NetworkFailure.serverError(
            "Status Code ${e.response!.statusCode}"));
      } else if (e.toString().contains('Connecting timed out')) {
        return left(const NetworkFailure.serverTimeOut());
      }
      return left(const NetworkFailure.unexpected());
    } catch (e) {
      return left(const NetworkFailure.unexpected());
    }
  }

  @override
  Future<Either<NetworkFailure, MyCoursesResponse>> getMyCourse(
      String userId) async {
    try {
      Response response = await apiClient!
          .getJsonInstance()
          .get(Api.getMyCources, queryParameters: {'user_id': UserDetailsLocal.userId});

      return right(MyCoursesResponse.fromJson(response.data));
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 401) {
          return left(
              NetworkFailure.unAuthorized(e.response!.data["message"] ?? ''));
        }
        return left(NetworkFailure.serverError(
            "Status Code ${e.response!.statusCode}"));
      } else if (e.toString().contains('Connecting timed out')) {
        return left(const NetworkFailure.serverTimeOut());
      }
      return left(const NetworkFailure.unexpected());
    } catch (e) {
      log(e.toString());
      return left(const NetworkFailure.unexpected());
    }
  }


  @override
  Future<Either<NetworkFailure, MyCourseReportResponse>> getCourseReport(
      Map data) async {
    try {
      Response response = await apiClient!
          .getJsonInstance()
          .post(Api.getCourseReport, data: data);

      return right(MyCourseReportResponse.fromJson(response.data));
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 401) {
          return left(
              NetworkFailure.unAuthorized(e.response!.data["message"] ?? ''));
        }
        return left(NetworkFailure.serverError(
            "Status Code ${e.response!.statusCode}"));
      } else if (e.toString().contains('Connecting timed out')) {
        return left(const NetworkFailure.serverTimeOut());
      }
      return left(const NetworkFailure.unexpected());
    } catch (e) {
      return left(const NetworkFailure.unexpected());
    }
  }

  @override
  Future<Either<NetworkFailure, AddCoursesResponse>> addCourseInstructor(
      FormData body) async {
    log("body->${body}");
    try {
      Response response = await apiClient!
          .getJsonInstance()
          .post(Api.addCourses, data: body);
print("response->${response.data}");
     return right(response.data);
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 401) {
          return left(
              NetworkFailure.unAuthorized(e.response!.data["message"] ?? ''));
        }
        return left(NetworkFailure.serverError(
            "Status Code ${e.response!.statusCode}"));
      } else if (e.toString().contains('Connecting timed out')) {
        return left(const NetworkFailure.serverTimeOut());
      }
      return left(const NetworkFailure.unexpected());
    } catch (e) {
      return left(const NetworkFailure.unexpected());
    }
  }


  @override
  Future<Either<NetworkFailure, InstructorCourseListResponse>> getInstructor(String userId) async {
    try {
      Response response = await apiClient!
          .getJsonInstance()
          .post(Api.getInstructorCources, data: {'user_id': UserDetailsLocal.userId});

      return right(InstructorCourseListResponse.fromJson(response.data));
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 401) {
          return left(
              NetworkFailure.unAuthorized(e.response!.data["message"] ?? ''));
        }
        return left(NetworkFailure.serverError(
            "Status Code ${e.response!.statusCode}"));
      } else if (e.toString().contains('Connecting timed out')) {
        return left(const NetworkFailure.serverTimeOut());
      }
      return left(const NetworkFailure.unexpected());
    } catch (e) {
      log(e.toString());
      return left(const NetworkFailure.unexpected());
    }
  }

  @override
  Future<Either<NetworkFailure, MyCoursesResponse>> getPurchasedCourses(String userId) async {
    try {
      Response response = await apiClient!
          .getJsonInstance()
          .get(Api.getMyCources, queryParameters: {'user_id': UserDetailsLocal.userId});

      return right(MyCoursesResponse.fromJson(response.data));
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 401) {
          return left(
              NetworkFailure.unAuthorized(e.response!.data["message"] ?? ''));
        }
        return left(NetworkFailure.serverError(
            "Status Code ${e.response!.statusCode}"));
      } else if (e.toString().contains('Connecting timed out')) {
        return left(const NetworkFailure.serverTimeOut());
      }
      return left(const NetworkFailure.unexpected());
    } catch (e) {
      log(e.toString());
      return left(const NetworkFailure.unexpected());
    }
  }

}
