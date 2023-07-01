part of 'all_categories_bloc.dart';

@freezed
class AllCategoriesEvent with _$AllCategoriesEvent {
  const factory AllCategoriesEvent.loadMyCourses() = _LoadMyCourses;

}
