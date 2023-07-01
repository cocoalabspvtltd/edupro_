part of 'my_course_bloc.dart';

@freezed
class MyCourseEvent with _$MyCourseEvent {
  const factory MyCourseEvent.started() = _Started;
  const factory MyCourseEvent.changeVideoTo(String url) = _ChangeVideoTo;
  const factory MyCourseEvent.fetchVideos(int courseId) = _FetchVideos;
  const factory MyCourseEvent.fetchAnnouncements(int courseId) =
      _FetchAnnouncements;
  const factory MyCourseEvent.fetchCertificateModel(int courseId) =
      _FetchCertificateModel;
  const factory MyCourseEvent.downloadCertificate(
    int userId,
    int courseId,
  ) = _DownloadCertificate;
  const factory MyCourseEvent.fetchQuestions(int courseId) = _FetchQuestions;
  const factory MyCourseEvent.fetchAnswers(
    int courseId,
    int questionId,
  ) = _FetchAnswers;
  const factory MyCourseEvent.enterQuestionTitle(String questionTitle) =
      _EnterQuestionTitle;
  const factory MyCourseEvent.enterQuestionSubject(String questionSubject) =
      _EnterQuestionSubject;
  const factory MyCourseEvent.askQuestions(
    int courseId,
    int userId,
  ) = _AskQuestions;
  const factory MyCourseEvent.enterAnswer(String answer) = _EnterAnswer;
  const factory MyCourseEvent.submitAnswer(
    int questionId,
    int userId,
    int courseId,
  ) = _SubmitAnswer;
  const factory MyCourseEvent.deleteAnswer(
    int questionId,
    int answerId,
    int courseId,
  ) = _DeleteAnswer;
}
