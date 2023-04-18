import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pgs_edupro/domain/auth/value_objects.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/insistution/insistutionResponse.dart';

import '../../domain/core/network/network_failures.dart';

import '../../infrastructure/remote_data/models/insiistution_adding_responses/insistution_student_response.dart';
import '../../infrastructure/remote_data/repositories/course/course_repository.dart';
import '../../presentation/ui/institution/students_of_institution/widgets/add_students_form.dart';
import '../../presentation/ui/instructor/instructor_add_course/courses_dropdown.dart';
import '../../presentation/ui/instructor/instructor_add_course/department_dropdown.dart';

part 'insiistution_student_event.dart';
part 'insiistution_student_state.dart';
part 'insiistution_student_bloc.freezed.dart';


class InsiistutionStudentBloc extends Bloc<InsiistutionStudentEvent, InsiistutionStudentState> {
  final CourseRepository addCoursesInstructor;
  int index;
  InsiistutionStudentBloc(this.addCoursesInstructor,this.index) : super(InsiistutionStudentState.initial()) {
    on<InsiistutionStudentEvent>((event, emit) async {});
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
      failureOrSuccess = await addCoursesInstructor.getInsistutionCategories(event.userId.toString());
      failureOrSuccess.fold((l,) => null, ((r) async {

        StudentList user = r.studentList![index];
        print("dec->${user}");
        emit(
          state.copyWith(

              names: Name(user.name ?? ''),
              email: TextEditingController(text: user.email),
              // phoneNumber: PhoneNumber(user.phoneNumber ?? ''),
              // dob: DateFormatted(user.dob ?? ''),
              // address: Address(user.address ?? ''),
              name: TextEditingController(text: user.name),
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
    on<_NameChanged>((event, emit) {
      emit(state.copyWith(
        names: Name(event.nameStr),
        submitFailedOrSuccessOption: none(),
      ));
    });
    on<_SubmitPressed>((event, emit) async {
      final isTitleValid = state.name != '' ? true : false;
      final isAboutTitleValid = state.email != '' ? true : false;
      Either<NetworkFailure, StudentAddResponse>? failureOrSuccess;

      if (isTitleValid && isAboutTitleValid) {
        emit(
          state.copyWith(
            showErrorMessages: false,
            isSubmitting: true,
            submitFailedOrSuccessOption: none(),
          ),
        );
        String? fileName = imageStudent!.path.split('/').last;
        print("->${fileName}");
        FormData body = FormData.fromMap({
          "name":state.name.text,
          "email":state.email.text,
          "department":departmentName,
          "course":categoryaName,
          "address":state.address.text,
          "phone_number":state.mobile.text+","+state.addtionalmobile.text,
          "dob":"1999/09/12",
          "profile_photo":await MultipartFile.fromFile(imageStudent!.path, filename: fileName)
        });
        // Map body = {
        //
        //
        // };

        //AppDialogs.loading();
        failureOrSuccess = await addCoursesInstructor.addStudentInsistutionj(body);
        Fluttertoast.showToast(msg:"Course added Successfully");
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

