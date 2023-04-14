import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/domain/course/i_course_repository.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/insistution/deletion_response.dart';

part 'instructor_deletion_event.dart';
part 'instructor_deletion_state.dart';
part 'instructor_deletion_bloc.freezed.dart';

class InstructorDeletionBloc extends Bloc<InstructorDeletionEvent, InstructorDeletionState> {
  final ICourseRepository deletionInstructorRepository;

  InstructorDeletionBloc(this.deletionInstructorRepository) : super(InstructorDeletionState.initial()) {


    on<_SaveAndUpdatePressed>((event, emit) async {
      Either<NetworkFailure, DeletionResponse>? failureOrSuccess;
      failureOrSuccess = await deletionInstructorRepository.instructorDeletion();
      Fluttertoast.showToast(msg:"Deleted Successfully");

    });

  }
}
