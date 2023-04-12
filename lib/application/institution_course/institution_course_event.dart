part of 'institution_course_bloc.dart';

@freezed
class InstitutionCourseEvent with _$InstitutionCourseEvent {
  const factory InstitutionCourseEvent.started() = _Started;
  const factory InstitutionCourseEvent.titleChanged(String titleStr) =
  _TitleChanged;
  const factory InstitutionCourseEvent.aboutTitleChanged(String aboutTitleStr) =
  _AboutTitleChanged;
  const factory InstitutionCourseEvent.categoryChanged(String categoryValue) =
  _CategoryChanged;
  const factory InstitutionCourseEvent.instructorChanged(String categoryValue) =
  _InstructorChanged;
  const factory InstitutionCourseEvent.amountChanged(String amountStr) =
  _AmountChanged;
  const factory InstitutionCourseEvent.courseFile(File displayPicture) =
  _courseFilePicture;
  const factory InstitutionCourseEvent.durationChanged(String durationStr) =
  _DurationChanged;
  const factory InstitutionCourseEvent.urlChanged(String urlStr) =
  _UrlChanged;
  const factory InstitutionCourseEvent.descriptionChanged(String descrptionStr) =
  _DescriptionChanged;
  const factory InstitutionCourseEvent.whatYChanged(String WhatYouStr) =
  _WhatYChanged;
  const factory InstitutionCourseEvent.areThereAnyChanged(String AreThereAnyStr) =
  _AreThereAnyChanged;
  const factory InstitutionCourseEvent.displayPicture(File Image) =
  _ImageChanged;
  const factory InstitutionCourseEvent.submitPressed() =  _SubmitPressed;
  const factory InstitutionCourseEvent.whoThisChanged(String whoThiStr) =
  _whoThiChanged;
}
