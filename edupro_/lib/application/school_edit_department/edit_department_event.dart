part of 'edit_department_bloc.dart';

@freezed
class EditDepartmentEvent with _$EditDepartmentEvent {
  const factory EditDepartmentEvent.nameChanged(String nameStr) = _NameChanged;
  const factory EditDepartmentEvent.saveAndUpdatePressed() = _SaveAndUpdatePressed;
}
