import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pgs_edupro/domain/course/i_course_repository.dart';
import 'package:pgs_edupro/domain/core/network/api_provider.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';

import 'package:pgs_edupro/infrastructure/remote_data/models/course/course_categories_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/course/course_in_category_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/course/course_report_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/insiistution_adding_responses/school_department_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/insistution/class_list_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/insistution/count.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/insistution/insistutionResponse.dart';

import 'package:pgs_edupro/infrastructure/remote_data/models/my_course/addcourses.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/my_course/my_courses_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/school/department_list_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/source/api.dart';
import 'package:pgs_edupro/presentation/ui/institution/classes_of_institution/classes_list_screen.dart';
import 'package:pgs_edupro/presentation/ui/institution/courses_of_insisitution/courses_list.dart';
import 'package:pgs_edupro/presentation/ui/institution/instructors_of_institution/instructors_list_screen.dart';
import 'package:pgs_edupro/presentation/ui/institution/students_of_institution/student_list_screen.dart';
import 'package:pgs_edupro/presentation/ui/school/departments/department_list_screen.dart';
import '../../models/insiistution_adding_responses/insistution_student_response.dart';
import '../../models/insiistution_adding_responses/institution_class_response.dart';
import '../../models/insiistution_adding_responses/institution_course_response.dart';
import '../../models/insiistution_adding_responses/institution_instructor_response.dart';
import '../../models/insistution/deletion_response.dart';


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
          .get(Api.getInstructorCources, queryParameters: {'user_id': UserDetailsLocal.userId});

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

  @override
  Future<Either<NetworkFailure, CountResponse>> getCountCourses(
      String userId) async {
    try {
      Response response = await apiClient!
          .getJsonInstance()
          .get(Api.getCount, queryParameters: {'user_id': UserDetailsLocal.userId});


      return right(CountResponse.fromJson(response.data));
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
  Future<Either<NetworkFailure, InsistutionResponse>> getInsistutionCategories(String userId) async {
    try {
      Response response = await apiClient!
          .getJsonInstance()
          .get(Api.insistutionCategoriesList, queryParameters: {'user_id': UserDetailsLocal.userId});

      return right(InsistutionResponse.fromJson(response.data));
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

/////////////////////////////////////////////////AddStudent////////////////////////////////////////////////

  @override
  Future<Either<NetworkFailure, StudentAddResponse>> addStudentInsistutionj(
      FormData body) async {
    log("body->${body}");
    try {
      Response response = await apiClient!
          .getJsonInstance()
          .post(Api.insistutionStudentadd, data: body);
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
  Future<Either<NetworkFailure, AddInstructorResponse>> addInstitutionInstructor(
      FormData body) async {
    log("body->${body}");

    try {
      Response response = await apiClient!
          .getJsonInstance()
          .post(Api.addInstructors, data: body);
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
  Future<Either<NetworkFailure, InsistutionResponse>> editStudent(
      FormData body) async {
    log("body->${body}");

    try {
      Response response = await apiClient!
          .getJsonInstance()
          .post(Api.insistutionStudentEdit, data: body);
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
  Future<Either<NetworkFailure, InsistutionResponse>> editInstructor(
      FormData body) async {
    log("body->${body}");

    try {
      Response response = await apiClient!
          .getJsonInstance()
          .post(Api.insistutionInstructorEdit, data: body);
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
  Future<Either<NetworkFailure, InsistutionResponse>> editCourse(
      FormData body) async {
    log("body->${body}");

    try {
      Response response = await apiClient!
          .getJsonInstance()
          .post(Api.insistutionInstructorEdit, data: body);
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
  Future<Either<NetworkFailure, ClassListResponse>> getClassList(
      String userId) async {
    try {
      Response response = await apiClient!
          .getJsonInstance()
          .get(Api.insistutionClassList, queryParameters: {'user_id': UserDetailsLocal.userId});


      return right(ClassListResponse.fromJson(response.data));
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
  Future<Either<NetworkFailure, AddCourseInstitutionResponse>> addCourseInstitution(
      FormData body) async {
    log("body->${body}");
    try {
      Response response = await apiClient!
          .getJsonInstance()
          .post(Api.addCoursesInstitution, data: body);
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
  Future<Either<NetworkFailure, AddClassesResponse>> addClassesInstitution(
      FormData body) async {
    log("body->${body}");
    try {
      Response response = await apiClient!
          .getJsonInstance()
          .post(Api.addClassesInstitution, data: body);
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
  Future<Either<NetworkFailure, DeletionResponse>> getDeletion(
      ) async {

    try {
      Response response = await apiClient!
          .getJsonInstance()
          .post(Api.deletionStudent, data: {"email":StudenyEmail});
      print("response->${response.data}");
      return right(DeletionResponse.fromJson(response.data));
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
  Future<Either<NetworkFailure, DeletionResponse>> classDeletion(
      ) async {

    try {
      Response response = await apiClient!
          .getJsonInstance()
          .post(Api.deletionClass, data: {"class_id":classid});
      print("response->${response.data}");
      return right(DeletionResponse.fromJson(response.data));
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
  Future<Either<NetworkFailure, DeletionResponse>> instructorDeletion(
      ) async {

    try {
      Response response = await apiClient!
          .getJsonInstance()
          .post(Api.deletionInstructor, data: {"email":InstructorEmail});
      print("response->${response.data}");
      return right(DeletionResponse.fromJson(response.data));
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
  Future<Either<NetworkFailure, DeletionResponse>> courseDeletion(
      ) async {

    try {
      Response response = await apiClient!
          .getJsonInstance()
          .post(Api.deletionCourse, data: {"course_id":course_id});
      print("response->${response.data}");
      return right(DeletionResponse.fromJson(response.data));
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
  Future<Either<NetworkFailure, DepartmentListResponse>> getDepartmentList() async {
    try {
      Response response = await apiClient!
          .getJsonInstance()
          .get(Api.getDepartmentschool);

      return right(DepartmentListResponse.fromJson(response.data));
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
  Future<Either<NetworkFailure, DeletionResponse>> departmentDeletion(
      ) async {

    try {
      Response response = await apiClient!
          .getJsonInstance()
          .post(Api.deletionDepartment, data: {"dept_id":depart_id});
      print("response->${response.data}");
      return right(DeletionResponse.fromJson(response.data));
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

  Future<Either<NetworkFailure, AddDepartmentResponse>> addDepartmentSchool(
      FormData body) async {
    log("body->${body}");
    try {
      Response response = await apiClient!
          .getJsonInstance()
          .post(Api.addDepartmentSchool, data: body);
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
  Future<Either<NetworkFailure,AddDepartmentResponse>> editDepartment(
      Map body) async {
    log("body->${body}");
    try {
      Response response = await apiClient!
          .getJsonInstance()
          .post(Api.editDepartemnt, data: body);
      if(response.statusCode==200){
        Fluttertoast.showToast(msg: "${response!.data["message"]}");
        Get.back();
      }
      return right(AddDepartmentResponse.fromJson(response.data));
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        if (e.response != null) {
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



}


