import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/domain/course/i_course_repository.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/insistution/deletion_response.dart';

part 'institution_deletion_class_event.dart';
part 'institution_deletion_class_state.dart';
part 'institution_deletion_class_bloc.freezed.dart';

class InstitutionDeletionClassBloc extends Bloc<InstitutionDeletionClassEvent, InstitutionDeletionClassState> {
  final ICourseRepository deletionClassRepository;

  InstitutionDeletionClassBloc(this.deletionClassRepository)
      : super(InstitutionDeletionClassState.initial()) {
    on<_SaveAndUpdatePressed>((event, emit) async {
      Either<NetworkFailure, DeletionResponse>? failureOrSuccess;
      failureOrSuccess = await deletionClassRepository.classDeletion();
      Fluttertoast.showToast(msg: "Deleted Successfully");
    });
  }
}
