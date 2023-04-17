part of 'department_list_bloc.dart';

@freezed
class DepartmentListEvent with _$DepartmentListEvent {
  const factory DepartmentListEvent.LoadDepartments() = _LoadDepartments;
}
