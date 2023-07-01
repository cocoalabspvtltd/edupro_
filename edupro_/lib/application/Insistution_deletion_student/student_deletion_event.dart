
part of 'student_deletion_bloc.dart';

@freezed
class StudentDeletionEvent with _$StudentDeletionEvent {
  const factory StudentDeletionEvent.saveAndUpdatePressed() = _SaveAndUpdatePressed;
}

