import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/domain/course/i_course_repository.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/insistution/deletion_response.dart';

part 'course_deletion_event.dart';
part 'course_deletion_state.dart';
part 'course_deletion_bloc.freezed.dart';

class CourseDeletionBloc extends Bloc<CourseDeletionEvent, CourseDeletionState> {
  final ICourseRepository deletionCourseRepository;

  CourseDeletionBloc(this.deletionCourseRepository) : super(CourseDeletionState.initial()) {


    on<_SaveAndUpdatePressed>((event, emit) async {
      Either<NetworkFailure, DeletionResponse>? failureOrSuccess;
      failureOrSuccess = await deletionCourseRepository.courseDeletion();
      Fluttertoast.showToast(msg:"Deleted Successfully");

    });

  }
}
