import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/domain/course/i_course_repository.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/insistution/insistutionResponse.dart';

import '../../domain/insistution/i_insistution_respo.dart';

part 'all_categories_event.dart';
part 'all_categories_state.dart';
part 'all_categories_bloc.freezed.dart';

class AllCategoriesBloc extends Bloc<AllCategoriesEvent, AllCategoriesState> {
  final ICourseRepository insistutionRepository;
  AllCategoriesBloc(this.insistutionRepository) : super(const AllCategoriesState.initial()) {

    on<_LoadMyCourses>((event, emit) async {
      emit( AllCategoriesState.loadInProgress());
      Either<NetworkFailure, InsistutionResponse> failureOrSuccess;

      failureOrSuccess = await insistutionRepository.getInsistutionCategories(UserDetailsLocal.userId);

      failureOrSuccess.fold((l) => emit(AllCategoriesState.loadFailure(l)),
              (r) => emit(AllCategoriesState.loadSuccess(r)));
    });

  }
}
