part of 'institution_class_bloc.dart';

@freezed

class InstitutionClassEvent with _$InstitutionClassEvent {

  const factory InstitutionClassEvent.started() = _Started;

  const factory InstitutionClassEvent.titleChanged(String titleStr) =
  _TitleChanged;
  const factory InstitutionClassEvent.durationChanged(String durationStr) =
  _DurationChanged;
  const factory InstitutionClassEvent.urlChanged(String urlStr) =
  _UrlChanged;
  const factory InstitutionClassEvent.courseChanged(String courseValue) =
  _CourseChanged;
  const factory InstitutionClassEvent.instructorChanged(String instructorValue) =
  _InstructorChanged;
  const factory InstitutionClassEvent.departmentChanged(String departmentValue) =
  _DepartmentChanged;
  const factory InstitutionClassEvent.profileFile(File displayPicture) =
  _classFilePicture;
  const factory InstitutionClassEvent.submitPressed() =   _SubmitPressed;

}