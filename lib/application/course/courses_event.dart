part of 'courses_bloc.dart';

@freezed
class CoursesEvent with _$CoursesEvent {
  const factory CoursesEvent.loadCourseCategories() = _LoadCourseCategories;
  const factory CoursesEvent.loadCoursesInCatogory(String categoryName) =
      _LoadCoursesInCatogory;
  const factory CoursesEvent.loadMyCourses() = _LoadMyCourses;
  const factory CoursesEvent.loadInstructorCourses() = _LoadInstructorCourses;
  const factory CoursesEvent.loadPurchaseCourses() = _LoadPurchaseCourses;
  const factory CoursesEvent.loadCourseReport(String fromDate, String toDate) =
      _LoadCourseReport;
}
