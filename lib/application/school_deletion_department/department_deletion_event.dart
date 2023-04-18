part of 'department_deletion_bloc.dart';

@freezed
class DepartmentDeletionEvent with _$DepartmentDeletionEvent {
  const factory DepartmentDeletionEvent.saveAndUpdatePressed() = _SaveAndUpdatePressed;
}
