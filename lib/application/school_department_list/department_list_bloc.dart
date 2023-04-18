import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/domain/course/i_course_repository.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/school/department_list_response.dart';

part 'department_list_event.dart';
part 'department_list_state.dart';
part 'department_list_bloc.freezed.dart';

class DepartmentListBloc extends Bloc<DepartmentListEvent, DepartmentListState> {
  final ICourseRepository depatmentRepository;
  DepartmentListBloc(this.depatmentRepository) : super(const DepartmentListState.initial()) {

    on<_LoadDepartments>((event, emit) async {
      emit( DepartmentListState.loadInProgress());
      Either<NetworkFailure, DepartmentListResponse> failureOrSuccess;

      failureOrSuccess = await depatmentRepository.getDepartmentList();

      failureOrSuccess.fold((l) => emit(DepartmentListState.loadFailure(l)),
              (r) => emit(DepartmentListState.loadSuccess(r)));

    });
  }
}
