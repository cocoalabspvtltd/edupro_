part of 'instructor_bloc.dart';

@freezed
class InstructorEvent with _$InstructorEvent {
  const factory InstructorEvent.started() = _Started;
  const factory InstructorEvent.titleChanged(String titleStr) =
  _TitleChanged;
  const factory InstructorEvent.aboutTitleChanged(String aboutTitleStr) =
  _AboutTitleChanged;
  const factory InstructorEvent.categoryChanged(String categoryValue) =
  _CategoryChanged;
  const factory InstructorEvent.amountChanged(String amountStr) =
  _AmountChanged;
  const factory InstructorEvent.durationChanged(String durationStr) =
  _DurationChanged;
  const factory InstructorEvent.urlChanged(String urlStr) =
  _UrlChanged;
  const factory InstructorEvent.courseFile(File displayPicture) =
  _courseFilePicture;
  const factory InstructorEvent.whatYChanged(String WhatYouStr) =
  _WhatYChanged;
  const factory InstructorEvent.areThereAnyChanged(String AreThereAnyStr) =
  _AreThereAnyChanged;
  const factory InstructorEvent.displayPicture(File Image) =
  _ImageChanged;
  const factory InstructorEvent.submitPressed() =   _SubmitPressed;
  const factory InstructorEvent.whoThisChanged(String whoThiStr) =
  _whoThiChanged;
}
