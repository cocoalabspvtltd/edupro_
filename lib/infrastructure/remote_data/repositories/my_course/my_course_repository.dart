import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pgs_edupro/domain/core/network/api_provider.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:pgs_edupro/domain/my_course/i_my_course_repository.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/common_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/my_course/my_course_videos_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/my_course/get_questions_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/my_course/get_answer_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/my_course/announcements_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/source/api.dart';

class MyCourseRepository implements IMyCourseRepository {
  ApiProvider? apiClient;

  MyCourseRepository() {
    apiClient ??= ApiProvider();
  }

  @override
  Future<Either<NetworkFailure, dynamic>> askQuestion(int courseId, int userId,
      String questionTitle, String questionSubject) async {
    try {
      Response response = await apiClient!.getJsonInstance().post(
        Api.askQuestion,
        data: {
          'course_id': courseId,
          'user_id': userId,
          'question_title': questionTitle,
          'question_subject': questionSubject,
        },
      );

      return right(CommonResponse.fromJson(response.data));
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
  Future<Either<NetworkFailure, dynamic>> deleteAnswer(
      int courseId, int userId, int questionId, int answerId) async {
    try {
      Response response = await apiClient!.getJsonInstance().post(
        Api.deleteAnswer,
        data: {
          'course_id': courseId,
          //'user_id': userId,
          'question_id': questionId,
          'answer_id': answerId,
        },
      );

      return right(CommonResponse.fromJson(response.data));
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
  Future<Either<NetworkFailure, dynamic>> downloadCourseCertificate(
      int courseId, int userId) {
    // TODO: implement downloadCourseCertificate
    throw UnimplementedError();
  }

  @override
  Future<Either<NetworkFailure, dynamic>> getMyCourseCertificateModel(
      int courseId) {
    // TODO: implement getMyCourseCertificateModel
    throw UnimplementedError();
  }

  @override
  Future<Either<NetworkFailure, dynamic>> submitAnswer(
      int courseId, int userId, int questionId, String answer) async {
    try {
      Response response = await apiClient!.getJsonInstance().post(
        Api.submitAnswer,
        data: {
          'course_id': courseId.toString(),
          'user_id': userId.toString(),
          'question_id': questionId.toString(),
          'answer': answer,
        },
      );

      return right(CommonResponse.fromJson(response.data));
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
  Future<Either<NetworkFailure, GetAnswerResponse>> getAnswers(
      int courseId, int questionId) async {
    try {
      Response response = await apiClient!.getJsonInstance().post(
          Api.getAnswers,
          data: {'course_id': courseId, 'question_id': questionId});

      return right(GetAnswerResponse.fromJson(response.data));
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
  Future<Either<NetworkFailure, MyCourseVideosResponse>> getMyCourseVideos(
      int courseId) async {
    try {
      Response response = await apiClient!
          .getJsonInstance()
          .post(Api.getMyCourseVideos, data: {'course_id': courseId});

      return right(MyCourseVideosResponse.fromJson(response.data));
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
  Future<Either<NetworkFailure, AnnouncementsResponse>>
      getMyCourseAnnouncements(int courseId) async {
    try {
      Response response = await apiClient!
          .getJsonInstance()
          .post(Api.courseAnnouncements, data: {'course_id': courseId});

      return right(AnnouncementsResponse.fromJson(response.data));
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
  Future<Either<NetworkFailure, GetQuestionsResponse>> getQuestions(
      int courseId) async {
    try {
      Response response = await apiClient!
          .getJsonInstance()
          .post(Api.getQuestions, data: {'course_id': courseId});

      return right(GetQuestionsResponse.fromJson(response.data));
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
