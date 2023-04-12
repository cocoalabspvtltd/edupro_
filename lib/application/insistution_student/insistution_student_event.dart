part of 'insistution_student_bloc.dart';

@freezed
class InsistutionStudentEvent with _$InsistutionStudentEvent {
  const factory InsistutionStudentEvent.started() = _Started;
  const factory InsistutionStudentEvent.name(String nameStr) =
  _TitleChanged;
  const factory InsistutionStudentEvent.emailChanged(String emailStr) =
  _AboutTitleChanged;
  const factory InsistutionStudentEvent.mobileChanged(String Value) =
  _CategoryChanged;
  const factory InsistutionStudentEvent.additionalNumChanged(String amountStr) =
  _AmountChanged;
  const factory InsistutionStudentEvent.addressChanged(String durationStr) =
  _DurationChanged;
  const factory InsistutionStudentEvent.dobChanged(String urlStr) =
  _UrlChanged;
  const factory InsistutionStudentEvent.profileFile(File displayPicture) =
  _courseFilePicture;
  const factory InsistutionStudentEvent.submitPressed() =   _SubmitPressed;

}

