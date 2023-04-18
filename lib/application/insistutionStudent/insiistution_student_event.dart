part of 'insiistution_student_bloc.dart';

@freezed
class InsiistutionStudentEvent with _$InsiistutionStudentEvent {

  const factory InsiistutionStudentEvent.started() = _Started;
  const factory InsiistutionStudentEvent.nameChanged(String nameStr) = _NameChanged;
  const factory InsiistutionStudentEvent.name(String nameStr) =
  _TitleChanged;
  const factory InsiistutionStudentEvent.emailChanged(String emailStr) =
  _AboutTitleChanged;
  const factory InsiistutionStudentEvent.mobileChanged(String Value) =
  _CategoryChanged;
  const factory InsiistutionStudentEvent.additionalNumChanged(String amountStr) =
  _AmountChanged;
  const factory InsiistutionStudentEvent.addressChanged(String durationStr) =
  _DurationChanged;
  const factory InsiistutionStudentEvent.dobChanged(String urlStr) =
  _UrlChanged;
  const factory InsiistutionStudentEvent.loadMyProfile(String userId) = _LoadMyProfile;
  const factory InsiistutionStudentEvent.profileFile(File displayPicture) =
  _courseFilePicture;
  const factory InsiistutionStudentEvent.submitPressed() =   _SubmitPressed;

}
