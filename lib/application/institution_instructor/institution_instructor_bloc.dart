import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as getx;
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/infrastructure/remote_data/insiistution_adding_responses/institution_instructor_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/course/course_repository.dart';
import 'package:pgs_edupro/presentation/ui/institution/courses_of_insisitution/widgets/add_course_form.dart';
import 'package:pgs_edupro/presentation/ui/institution/instructors_of_institution/widgets/add_instructors_form.dart';
import 'package:pgs_edupro/presentation/ui/instructor/instructor_add_course/courses_dropdown.dart';


part 'institution_instructor_event.dart';
part 'institution_instructor_state.dart';
part 'institution_instructor_bloc.freezed.dart';

class InstitutionInstructorBloc extends Bloc<InstitutionInstructorEvent, InstitutionInstructorState> {
  final CourseRepository addInstituitionInstructor;
  InstitutionInstructorBloc(this.addInstituitionInstructor) : super(InstitutionInstructorState.initial()) {
    on<InstitutionInstructorEvent>((event, emit) async {});

    on<_CategoryChanged>((event, emit) {
      emit(state.copyWith(
        category: event.categoryValue,
        submitFailedOrSuccessOption: none(),
      ));
    });

    on<_SubmitPressed>((event, emit) async {
      final isNameValid = state.name != '' ? true : false;
      final isEmailValid = state.email != '' ? true : false;
      Either<NetworkFailure, AddInstructorResponse>? failureOrSuccess;

      if (isNameValid && isEmailValid) {
        emit(
          state.copyWith(
            showErrorMessages: false,
            isSubmitting: true,
            submitFailedOrSuccessOption: none(),
          ),
        );
        String? fileName = imageInstructorC!.path.split('/').last;
        print("->${fileName}");
        FormData body = FormData.fromMap({
          "name": state.name.text,
          "email": state.email.text,
          "phone_number": state.mobile.text+','+ state.addtionalmobile.text,
          "courses": categoryaName,
          "qualification":state.qualification.text,
          "description": state.description.text,
          "password":state.password.text,
          "profile_picture": await MultipartFile.fromFile(
              imageInstructorC!.path, filename: fileName)
        });

        failureOrSuccess = await addInstituitionInstructor.addInstitutionInstructor(body);
        Fluttertoast.showToast(msg: "Instructor added Successfully");
        getx.Get.back();
      }

    });
  }
}
