part of 'course_deletion_bloc.dart';

@freezed
class CourseDeletionEvent with _$CourseDeletionEvent {
  const factory CourseDeletionEvent.saveAndUpdatePressed() = _SaveAndUpdatePressed;
}
