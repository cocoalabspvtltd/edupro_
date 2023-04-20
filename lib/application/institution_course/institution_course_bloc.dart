import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:pgs_edupro/domain/core/network/network_failures.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/insiistution_adding_responses/institution_course_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/insistution/insistutionResponse.dart';

import 'package:pgs_edupro/infrastructure/remote_data/repositories/course/course_repository.dart';
import 'package:pgs_edupro/presentation/ui/institution/courses_of_insisitution/widgets/add_course_form.dart';
import 'package:pgs_edupro/presentation/ui/instructor/instructor_add_course/courses_dropdown.dart';
import 'package:pgs_edupro/presentation/ui/instructor/instructor_add_course/instructor_dropdown.dart';

import '../../presentation/ui/institution/students_of_institution/widgets/insistution_view.dart';

part 'institution_course_event.dart';
part 'institution_course_state.dart';
part 'institution_course_bloc.freezed.dart';

class InstitutionCourseBloc extends Bloc<InstitutionCourseEvent, InstitutionCourseState> {
  final CourseRepository addCoursesInstitution;
  int index;
  InstitutionCourseBloc(this.addCoursesInstitution,this.index) : super(InstitutionCourseState.initial()) {
    on<InstitutionCourseEvent>((event, emit) async {});

    on<_CategoryChanged>((event, emit) {
      emit(state.copyWith(
        category: event.categoryValue,
        submitFailedOrSuccessOption: none(),
      ));
    });

    on<_InstructorChanged>((event, emit) {
      emit(state.copyWith(
        category: event.categoryValue,
        submitFailedOrSuccessOption: none(),
      ));
    });

    on<_LoadMyProfile>((event, emit) async {
      //  print("dcxs2=>${UserDetailsLocal.apiToken}");
      emit(
        state.copyWith(
          isLoading: true,
          submitFailedOrSuccessOption: none(),
          // changePasswordFailedOrSuccessOption: none(),
          loadFailureOrSuccessOption: none(),
        ),
      );
      //print("dcxs3=>${UserDetailsLocal.apiToken}");
      Either<NetworkFailure, InsistutionResponse> failureOrSuccess;
      failureOrSuccess = await addCoursesInstitution.getInsistutionCategories(event.userId.toString());
      failureOrSuccess.fold((l,) => null, ((r) async {

        Course user = r.course![index];
        print("dec->${user}");
        emit(
          state.copyWith(

            title: TextEditingController(text: user.title),
        aboutTitle: TextEditingController(text: user.aboutTitle),
        amount:  TextEditingController(text: user.amount),
        duration: TextEditingController(text: user.duration) ,
            description:  TextEditingController(text: user.description),
        category: categoryaName,
        instructor:  "instructroName",


            // phoneNumber: PhoneNumber(user.phoneNumber ?? ''),
            // dob: DateFormatted(user.dob ?? ''),
            // address: Address(user.address ?? ''),

            // emailController: TextEditingController(text: user.email),
            // phoneNumberController: TextEditingController(text: user.phoneNumber),
            // dobDT: user.dob != null ? DateTime.parse(user.dob!) : null,
            // addressController: TextEditingController(text: user.address)
          ),
        );

      }));

      emit(state.copyWith(
        isLoading: false,
        // loadFailureOrSuccessOption: optionOf(failureOrSuccess)
      )
      );
    });

    on<_SubmitPressed>((event, emit) async {
      final isTitleValid = state.title != '' ? true : false;
      final isAboutTitleValid = state.aboutTitle != '' ? true : false;
      Either<NetworkFailure, AddCourseInstitutionResponse>? failureOrSuccess;

      if (isTitleValid && isAboutTitleValid) {
        emit(
          state.copyWith(
            showErrorMessages: false,
            isSubmitting: true,
            submitFailedOrSuccessOption: none(),
          ),
        );
        String? fileName = imageCourseC!
            .path
            .split('/')
            .last;
        print("->${fileName}");
        FormData body = FormData.fromMap({
          "title": state.title.text,
          "about_title": state.aboutTitle.text,
          "amount": state.amount.text,
          "duration": state.duration.text,
          "category": categoryaName,
          "instructor":instructorName,
          "url": state.url.text,
          "description": "${state.description.text}<br><br><p>${state
              .whatYouLearn.text}</p><br><br><p>${state.areThere
              .text}</p><br><br><p>${state.whoIsThis.text}",
          "course_thumbnail": await MultipartFile.fromFile(
              imageCourseC!.path, filename: fileName)
        });


        //AppDialogs.loading();
        failureOrSuccess = await addCoursesInstitution.addCourseInstitution(body);
        Fluttertoast.showToast(msg: "Course added Successfully");
        getx.Get.back();
      }

    });
    on<_EditSubmitPressed>((event, emit) async {
      final isTitleValid = state.title != '' ? true : false;
      final isAboutTitleValid = state.aboutTitle != '' ? true : false;
      Either<NetworkFailure, InsistutionResponse>? failureOrSuccess;

      if (isTitleValid && isAboutTitleValid) {

        emit(
          state.copyWith(
            showErrorMessages: false,
            isSubmitting: true,
            submitFailedOrSuccessOption: none(),
          ),
        );
        String? fileName = imageStudent ?.path.split('/').last;
        print("->${fileName}");
        FormData body = FormData.fromMap({
          "title": state.title.text,
          "about_title": state.aboutTitle.text,
          "amount": state.amount.text,
          "duration": state.duration.text,
          "category": categoryaName,
          "instructor":instructorName,
          "url": state.url.text,
          "description": "${state.description.text}<br><br><p>${state
              .whatYouLearn.text}</p><br><br><p>${state.areThere
              .text}</p><br><br><p>${state.whoIsThis.text}",
          "course_thumbnail": await MultipartFile.fromFile(
              imageCourseC!.path, filename: fileName)
        });

        // Map body = {
        //
        //
        // };

        //AppDialogs.loading();
        failureOrSuccess = await addCoursesInstitution.editCourse(body);
        Fluttertoast.showToast(msg:"Course added Successfully");
        // getx.Get.back();
      }

      // emit(state.copyWith(
      //   isLoading: false,
      //   loadFailureOrSuccessOption: optionOf(failureOrSuccess ),
      // ));
      //
      // emit(state.copyWith(
      //     isSubmitting: false,
      //     showErrorMessages: true,
      //     submitFailedOrSuccessOption: optionOf(failureOrSuccess)));
    });
  }
}
