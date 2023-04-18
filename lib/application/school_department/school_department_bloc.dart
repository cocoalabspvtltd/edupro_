import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as getx;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/insiistution_adding_responses/school_department_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/course/course_repository.dart';

part 'school_department_event.dart';
part 'school_department_state.dart';
part 'school_department_bloc.freezed.dart';

class SchoolDepartmentBloc extends Bloc<SchoolDepartmentEvent, SchoolDepartmentState> {
  final CourseRepository addDepartmentssInstitution;
  SchoolDepartmentBloc(this.addDepartmentssInstitution) : super(SchoolDepartmentState.initial()) {
    on<SchoolDepartmentEvent>((event, emit) async {});

    on<_SubmitPressed>((event, emit) async {
      final isNameValid = state.name != '' ? true : false;
      Either<NetworkFailure, AddDepartmentResponse>? failureOrSuccess;

      if (isNameValid ) {
        emit(
          state.copyWith(
            showErrorMessages: false,
            isSubmitting: true,
            submitFailedOrSuccessOption: none(),
          ),
        );
        FormData body = FormData.fromMap({
          "name": state.name.text,
        });


        //AppDialogs.loading();
        failureOrSuccess = await addDepartmentssInstitution.addDepartmentSchool(body);
        Fluttertoast.showToast(msg: "Department added Successfully");
        getx.Get.back();
      }

    });
  }
}
