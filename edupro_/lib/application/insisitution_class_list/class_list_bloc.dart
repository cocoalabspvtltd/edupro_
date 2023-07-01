import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/insistution/class_list_response.dart';

import '../../domain/core/network/network_failures.dart';
import '../../domain/course/i_course_repository.dart';
import '../../infrastructure/local_data_source/user.dart';

part 'class_list_event.dart';
part 'class_list_state.dart';
part 'class_list_bloc.freezed.dart';

class ClassListBloc extends Bloc<ClassListEvent, ClassListState> {
  final ICourseRepository insistutionRepository;
  ClassListBloc(this.insistutionRepository) : super(const ClassListState.initial()) {

    on<_LoadMyCourses>((event, emit) async {
      emit( ClassListState.loadInProgress());
      Either<NetworkFailure, ClassListResponse> failureOrSuccess;

      failureOrSuccess = await insistutionRepository.getClassList(UserDetailsLocal.userId);

      failureOrSuccess.fold((l) => emit(ClassListState.loadFailure(l)),
              (r) => emit(ClassListState.loadSuccess(r)));
    });
  }
}
