part of 'institution_instructor_bloc.dart';

@freezed

class InstitutionInstructorEvent with _$InstitutionInstructorEvent {
  const factory InstitutionInstructorEvent.started() = _Started;
  const factory InstitutionInstructorEvent.nameChanged(String nameStr) =
  _NameChanged;
  const factory InstitutionInstructorEvent.mobileChanged(String mobileStr) =
  _MobileChanged;
  const factory InstitutionInstructorEvent.additionalmobileChanged(String addmobileStr) =
  _AdditionalMobileChanged;
  const factory InstitutionInstructorEvent.categoryChanged(String categoryValue) =
  _CategoryChanged;
  const factory InstitutionInstructorEvent.qualificationChanged(String qualiStr) =
  _QualificationChanged;
  const factory InstitutionInstructorEvent.descriptionChanged(String descrptionStr) =
  _DescriptionChanged;
  const factory InstitutionInstructorEvent.loadMyProfile(String userId) = _LoadMyProfile;
  const factory InstitutionInstructorEvent.emailChanged(String emailStr) =
  _EmailChanged;
  const factory InstitutionInstructorEvent.passwordChanged(String passwordStr) =
  _PasswordChanged;
  const factory InstitutionInstructorEvent.displayPicture(File Image) =
  _ImageChanged;
  const factory InstitutionInstructorEvent.submitPressed() = _SubmitPressed;
  const factory InstitutionInstructorEvent.editsubmitPressed() =   _EditSubmitPressed;
}

