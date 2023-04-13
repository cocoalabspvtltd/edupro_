import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/infrastructure/remote_data/insiistution_adding_responses/institution_class_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/course/course_repository.dart';
import 'package:pgs_edupro/presentation/ui/institution/classes_of_institution/widgets/add_classes_form.dart';
import 'package:pgs_edupro/presentation/ui/instructor/instructor_add_course/courses_dropdown.dart';
import 'package:pgs_edupro/presentation/ui/instructor/instructor_add_course/department_dropdown.dart';
import 'package:pgs_edupro/presentation/ui/instructor/instructor_add_course/instructor_dropdown.dart';

part 'institution_class_event.dart';
part 'institution_class_state.dart';
part 'institution_class_bloc.freezed.dart';

class InstitutionClassBloc extends Bloc<InstitutionClassEvent, InstitutionClassState> {
  final CourseRepository addClassesInstitution;
  InstitutionClassBloc(this.addClassesInstitution) : super(InstitutionClassState.initial()) {
    on<InstitutionClassEvent>((event, emit) async {});

    on<_CourseChanged>((event, emit) {
      emit(state.copyWith(
        course: event.courseValue,
        submitFailedOrSuccessOption: none(),
      ));
    });

    on<_InstructorChanged>((event, emit) {
      emit(state.copyWith(
        instructor: event.instructorValue,
        submitFailedOrSuccessOption: none(),
      ));
    });

    on<_DepartmentChanged>((event, emit) {
      emit(state.copyWith(
        department: event.departmentValue,
        submitFailedOrSuccessOption: none(),
      ));
    });

    on<_SubmitPressed>((event, emit) async {
      final isTitleValid = state.title != '' ? true : false;
      final isUrlValid = state.url != '' ? true : false;
      Either<NetworkFailure, AddClassesResponse>? failureOrSuccess;

      if (isTitleValid && isUrlValid) {
        emit(
          state.copyWith(
            showErrorMessages: false,
            isSubmitting: true,
            submitFailedOrSuccessOption: none(),
          ),
        );
        String? fileName = imageClassesC!
            .path
            .split('/')
            .last;
        print("->${fileName}");
        FormData body = FormData.fromMap({
          "video_title": state.title.text,
          "video_duration": state.duration.text,
          "course": categoryaName,
          "instructor_name":instructorName,
          "category":departmentName,
          "video_url": state.url.text,
          "video_thumbnail": await MultipartFile.fromFile(
              imageClassesC!.path, filename: fileName)
        });


        //AppDialogs.loading();
        failureOrSuccess = await addClassesInstitution.addClassesInstitution(body);
        Fluttertoast.showToast(msg: "class added Successfully");
        getx.Get.back();
      }

    });
  }
}
