import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'insistution_student_event.dart';
part 'insistution_student_state.dart';
part 'insistution_student_bloc.freezed.dart';

class InsistutionStudentBloc extends Bloc<InsistutionStudentEvent, InsistutionStudentState> {
  InsistutionStudentBloc() : super(const InsistutionStudentState.initial()) {
    on<InsistutionStudentEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
