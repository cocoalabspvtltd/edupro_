import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pgs_edupro/domain/auth/value_objects.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/domain/course/i_course_repository.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/insiistution_adding_responses/school_department_response.dart';
import 'package:pgs_edupro/presentation/ui/school/departments/department_list_screen.dart';
import 'package:pgs_edupro/presentation/widgets/app_dialogs.dart';

part 'edit_department_event.dart';
part 'edit_department_state.dart';
part 'edit_department_bloc.freezed.dart';

class EditDepartmentBloc extends Bloc<EditDepartmentEvent, EditDepartmentState> {
  final ICourseRepository editDepartRepository;
  EditDepartmentBloc(this.editDepartRepository) : super(EditDepartmentState.initial()) {

    on<_NameChanged>((event, emit) {
      emit(state.copyWith(
        name: Name(event.nameStr),
        submitFailedOrSuccessOption: none(),
      ));
    });

    on<_SaveAndUpdatePressed>((event, emit) async {

      final isNameValid = state.name.isValid();

      Either<NetworkFailure, AddDepartmentResponse>? failureOrSuccess;


      if (isNameValid) {
        emit(
          state.copyWith(
            showErrorMessages: false,
            isSubmitting: true,
            submitFailedOrSuccessOption: none(),
          ),
        );
        Map body = {
          "id": depart_id,
          "name": state.name.value.getOrElse(() => ''),
        };
        failureOrSuccess = await editDepartRepository.editDepartment(body);
        getx.Get.back();
      }


      emit(state.copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          submitFailedOrSuccessOption: optionOf(failureOrSuccess)));
    });

    }
  }
