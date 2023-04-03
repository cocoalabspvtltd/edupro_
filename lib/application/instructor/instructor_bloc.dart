import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/course/course_repository.dart';

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



    // on<_$_TitleChanged>((event, emit) {
    //   emit(state.copyWith(
    //     title: Title(event.titleStr),
    //     submitFailedOrSuccessOption: none(),
    //   ));
    // });

    on<_SubmitPressed>((event, emit) async {
      final isTitleValid = state.title != '' ? true : false;
      final isAboutTitleValid = state.aboutTitle != '' ? true : false;
      Either<NetworkFailure, Unit>? failureOrSuccess;

      if (isTitleValid && isAboutTitleValid) {
        emit(
          state.copyWith(
            showErrorMessages: false,
            isSubmitting: true,
            submitFailedOrSuccessOption: none(),
          ),
        );

        Map body = {
          "title": state.title.text,
          "about_title": state.aboutTitle.text,
          "amount": state.amount.text,
          "duration": state.duration.text,
          "category": state.category,
          "url": state.url.text,
          "description":
              "${state.description.text}<br><br><p>${state.whatYouLearn.text}</p><br><br><p>${state.areThere.text}</p><br><br><p>${state.whoIsThis.text}",
          "course_thumbnail":state.displayPicture
        };
        //   "${state.description}<br><br><p>${state.whatYouLearn}</p><br><br><p>${state.areThere}</p><br><br><p>${state.whoIsThis}",
        //           "course_thumbnail":state.displayPicture
    //    AppDialogs.loading();
        failureOrSuccess = await addCoursesInstructor.addCourseInstructor(body);

       // getx.Get.back();

      }

      emit(state.copyWith(
        isLoading: false,
        loadFailureOrSuccessOption: optionOf(failureOrSuccess),
      ));

      emit(state.copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          submitFailedOrSuccessOption: optionOf(failureOrSuccess)));
    });
  }
}
