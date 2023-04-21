import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as getx;
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:pgs_edupro/domain/core/network/network_failures.dart';

import 'package:pgs_edupro/infrastructure/remote_data/repositories/course/course_repository.dart';
import 'package:pgs_edupro/presentation/ui/institution/courses_of_insisitution/widgets/add_course_form.dart';
import 'package:pgs_edupro/presentation/ui/institution/instructors_of_institution/widgets/add_instructors_form.dart';
import 'package:pgs_edupro/presentation/ui/instructor/instructor_add_course/courses_dropdown.dart';

import '../../infrastructure/remote_data/models/insiistution_adding_responses/institution_instructor_response.dart';
import '../../infrastructure/remote_data/models/insistution/insistutionResponse.dart';
import '../../presentation/ui/institution/students_of_institution/widgets/add_students_form.dart';


part 'institution_instructor_event.dart';
part 'institution_instructor_state.dart';
part 'institution_instructor_bloc.freezed.dart';

class InstitutionInstructorBloc extends Bloc<InstitutionInstructorEvent, InstitutionInstructorState> {
  final CourseRepository addInstituitionInstructor;
  int index;
  InstitutionInstructorBloc(this.addInstituitionInstructor,this.index) : super(InstitutionInstructorState.initial()) {
    on<InstitutionInstructorEvent>((event, emit) async {});

    on<_CategoryChanged>((event, emit) {
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
      failureOrSuccess = await addInstituitionInstructor.getInsistutionCategories(event.userId.toString());
      failureOrSuccess.fold((l,) => null, ((r) async {

        Instructors user = r.instructors![index];
        print("dec->${user}");
        emit(
          state.copyWith(

            name: TextEditingController(text: user.name),
            email: TextEditingController(text: user.email),
            mobile:  TextEditingController(text: user.phoneNumber),
            addtionalmobile: TextEditingController(text: user.phoneNumber) ,
            qualification:  TextEditingController(text: user.qualification),
            description:  TextEditingController(text: user.description),
            password:  TextEditingController(text: ""),
            displayPicture: imageStudent,
          ),
        );

      }));

      emit(state.copyWith(
        isLoading: false,
        // loadFailureOrSuccessOption: optionOf(failureOrSuccess)
      )
      );
    });


    on<_EditSubmitPressed>((event, emit) async {
      final isTitleValid = state.name != '' ? true : false;
      final isAboutTitleValid = state.email != '' ? true : false;
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
          "name": state.name.text,
          "email": state.email.text,
          "phone_number": state.mobile.text+','+ state.addtionalmobile.text,
          "courses": categoryaName,
          "qualification":state.qualification.text,
          "description": state.description.text,
          "password":state.password.text,
          "profile_picture": "gfyhh"
        });
        // Map body = {
        //
        //
        // };

        //AppDialogs.loading();
        failureOrSuccess = await addInstituitionInstructor.editInstructor(body);
        Fluttertoast.showToast(msg:"Instructor updated Successfully");
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
