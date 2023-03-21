import 'package:dartz/dartz.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/domain/course/i_course_repository.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/course/course_categories_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/course/course_in_category_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/course/course_report_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/my_course/my_courses_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'courses_event.dart';
part 'courses_state.dart';
part 'courses_bloc.freezed.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  final ICourseRepository courseRepository;
  CoursesBloc(this.courseRepository) : super(const Initial()) {
    on<CoursesEvent>((event, emit) async {
      if (event is _LoadCourseCategories) {
        emit(const CoursesState.loadInProgress());
        Either<NetworkFailure, CourseCategoriesResponse> failureOrSuccess;

        failureOrSuccess = await courseRepository.getCourseCategories();

        failureOrSuccess.fold((l) => emit(CoursesState.loadFailure(l)),
            (r) => emit(CoursesState.loadSuccess(r)));
      }
    });
    on<_LoadCoursesInCatogory>((event, emit) async {
      emit(const CoursesState.loadInProgress());
      Either<NetworkFailure, CourseInCategoryResponse> failureOrSuccess;

      failureOrSuccess = await courseRepository.getCoursesInCategory(
          UserDetailsLocal.userId, event.categoryName,);

      failureOrSuccess.fold((l) => emit(CoursesState.loadFailure(l)),
          (r) => emit(CoursesState.loadSuccess(r)));
    });

    on<_LoadMyCourses>((event, emit) async {
      emit(const CoursesState.loadInProgress());
      Either<NetworkFailure, MyCoursesResponse> failureOrSuccess;

      failureOrSuccess =
          await courseRepository.getMyCourse(UserDetailsLocal.userId);

      failureOrSuccess.fold((l) => emit(CoursesState.loadFailure(l)),
          (r) => emit(CoursesState.loadSuccess(r)));
    });

    on<_LoadCourseReport>((event, emit) async {
      emit(const CoursesState.loadInProgress());
      Either<NetworkFailure, MyCourseReportResponse> failureOrSuccess;
      Map data = {
        "user_id": UserDetailsLocal.userId,
        "from_date": event.fromDate,
        "to_date": event.toDate
      };

      failureOrSuccess = await courseRepository.getCourseReport(data);

      failureOrSuccess.fold((l) => emit(CoursesState.loadFailure(l)),
          (r) => emit(CoursesState.loadSuccess(r)));
    });
  }
}
