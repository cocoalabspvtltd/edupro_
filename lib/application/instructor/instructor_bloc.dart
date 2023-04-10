import 'dart:io';
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/course/course_repository.dart';
import 'package:pgs_edupro/presentation/ui/instructor/instructor_add_course/add_course1.dart';

import '../../infrastructure/remote_data/models/my_course/addcourses.dart';
import '../../presentation/widgets/app_dialogs.dart';

part 'instructor_event.dart';

part 'instructor_state.dart';

part 'instructor_bloc.freezed.dart';

class InstructorBloc extends Bloc<InstructorEvent, InstructorState> {
  final CourseRepository addCoursesInstructor;
  InstructorBloc(this.addCoursesInstructor) : super(InstructorState.initial()) {
    on<InstructorEvent>((event, emit) async {});

    on<_CategoryChanged>((event, emit) {
      emit(state.copyWith(
        category: event.categoryValue,
        submitFailedOrSuccessOption: none(),
      ));
    });





    on<_SubmitPressed>((event, emit) async {
      final isTitleValid = state.title != '' ? true : false;
      final isAboutTitleValid = state.aboutTitle != '' ? true : false;
      Either<NetworkFailure, AddCoursesResponse>? failureOrSuccess;

      if (isTitleValid && isAboutTitleValid) {
        emit(
          state.copyWith(
            showErrorMessages: false,
            isSubmitting: true,
            submitFailedOrSuccessOption: none(),
          ),
        );
        String? fileName = imageC!.path.split('/').last;
        print("->${fileName}");
        FormData body = FormData.fromMap({
          "title": state.title.text,
          "about_title": state.aboutTitle.text,
          "amount": state.amount.text,
          "duration":state.duration.text,
          "category": "tgt",
          "url": state.url.text,
          "description":"${state.description.text}<br><br><p>${state.whatYouLearn.text}</p><br><br><p>${state.areThere.text}</p><br><br><p>${state.whoIsThis.text}",
          "course_thumbnail":await MultipartFile.fromFile(imageC!.path, filename: fileName)

        });
        // Map body = {
        //
        //
        // };

    //    AppDialogs.loading();
       // failureOrSuccess = await addCoursesInstructor.addCourseInstructor(body);

       // getx.Get.back();

      }

      // emit(state.copyWith(
      //   isLoading: false,
      //   loadFailureOrSuccessOption: optionOf(failureOrSuccess),
      // ));
      //
      // emit(state.copyWith(
      //     isSubmitting: false,
      //     showErrorMessages: true,
      //     submitFailedOrSuccessOption: optionOf(failureOrSuccess)));
    });
  }
}
