part of 'courses_bloc.dart';

@freezed
class CoursesEvent with _$CoursesEvent {
  const factory CoursesEvent.loadCourseCategories() = _LoadCourseCategories;
  const factory CoursesEvent.loadCoursesInCatogory(String categoryName) =
      _LoadCoursesInCatogory;
  const factory CoursesEvent.loadMyCourses() = _LoadMyCourses;
  const factory CoursesEvent.loadCourseReport(String fromDate, String toDate) =
      _LoadCourseReport;
}
