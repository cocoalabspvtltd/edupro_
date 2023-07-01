import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pgs_edupro/domain/course/i_course_repository.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/insistution/deletion_response.dart';

import '../../domain/core/network/network_failures.dart';

part 'student_deletion_event.dart';
part 'student_deletion_state.dart';
part 'student_deletion_bloc.freezed.dart';

class StudentDeletionBloc extends Bloc<StudentDeletionEvent, StudentDeletionState> {
  final ICourseRepository deletionStudentRepository;

  StudentDeletionBloc(this.deletionStudentRepository) : super(StudentDeletionState.initial()) {


    on<_SaveAndUpdatePressed>((event, emit) async {
      Either<NetworkFailure, DeletionResponse>? failureOrSuccess;
      failureOrSuccess = await deletionStudentRepository.getDeletion();
      Fluttertoast.showToast(msg:"Deleted Successfully");

    });



  }
}
