part of 'instructor_deletion_bloc.dart';

@freezed
class InstructorDeletionEvent with _$InstructorDeletionEvent {
  const factory InstructorDeletionEvent.started() = _Started;
}
