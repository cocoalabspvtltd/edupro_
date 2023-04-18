import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/domain/course/i_course_repository.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/insistution/deletion_response.dart';

part 'department_deletion_event.dart';
part 'department_deletion_state.dart';
part 'department_deletion_bloc.freezed.dart';

class DepartmentDeletionBloc extends Bloc<DepartmentDeletionEvent, DepartmentDeletionState> {
  final ICourseRepository deletionDepartmentRepository;

  DepartmentDeletionBloc(this.deletionDepartmentRepository) : super(DepartmentDeletionState.initial()) {


    on<_SaveAndUpdatePressed>((event, emit) async {
      Either<NetworkFailure, DeletionResponse>? failureOrSuccess;
      failureOrSuccess = await deletionDepartmentRepository.departmentDeletion();
      Fluttertoast.showToast(msg:"Deleted Successfully");

    });

  }
}
