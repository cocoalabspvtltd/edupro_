import 'package:dartz/dartz.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/my_course/announcements_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/my_course/get_answer_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/my_course/get_questions_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/my_course/my_course_videos_response.dart';

abstract class IMyCourseRepository {
  Future<Either<NetworkFailure, MyCourseVideosResponse>> getMyCourseVideos(
      int courseId);
  Future<Either<NetworkFailure, AnnouncementsResponse>>
      getMyCourseAnnouncements(int courseId);
  Future<Either<NetworkFailure, dynamic>> getMyCourseCertificateModel(
      int courseId);

  Future<Either<NetworkFailure, dynamic>> downloadCourseCertificate(
      int courseId, int userId);
  Future<Either<NetworkFailure, GetQuestionsResponse>> getQuestions(
      int courseId);
  Future<Either<NetworkFailure, GetAnswerResponse>> getAnswers(
      int courseId, int questionId);
  Future<Either<NetworkFailure, dynamic>> askQuestion(
      int courseId, int userId, String questionTitle, String questionSubject);
  Future<Either<NetworkFailure, dynamic>> submitAnswer(
      int courseId, int userId, int questionId, String answer);
  Future<Either<NetworkFailure, dynamic>> deleteAnswer(
      int courseId, int userId, int questionId, int answerId);
}
