part of 'school_department_bloc.dart';

@freezed
class SchoolDepartmentEvent with _$SchoolDepartmentEvent {
  const factory SchoolDepartmentEvent.started() = _Started;
  const factory SchoolDepartmentEvent.nameChanged(String nameStr) =
  _NameChanged;
  const factory SchoolDepartmentEvent.submitPressed() =  _SubmitPressed;
}
