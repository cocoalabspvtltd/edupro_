import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/insistution/count.dart';

import '../../domain/core/network/network_failures.dart';
import '../../domain/course/i_course_repository.dart';
import '../../infrastructure/local_data_source/user.dart';

part 'insistution_event.dart';
part 'insistution_state.dart';
part 'insistution_bloc.freezed.dart';



class InsistutionBloc extends Bloc<InsistutionEvent, InsistutionState> {
  final ICourseRepository courseRepository;
  InsistutionBloc(this.courseRepository) : super( Initial()) {


    on<_LoadMyCourses>((event, emit) async {
      emit(const InsistutionState.loadInProgress());
      Either<NetworkFailure, CountResponse> failureOrSuccess;

      failureOrSuccess =
      await courseRepository.getCountCourses(UserDetailsLocal.userId);

      failureOrSuccess.fold((l) => emit(InsistutionState.loadFailure(l)),
              (r) => emit(InsistutionState.loadSuccess(r)));
    });

  }
}