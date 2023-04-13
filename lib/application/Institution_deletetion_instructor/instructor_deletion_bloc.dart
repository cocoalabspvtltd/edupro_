import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'instructor_deletion_event.dart';
part 'instructor_deletion_state.dart';
part 'instructor_deletion_bloc.freezed.dart';

class InstructorDeletionBloc extends Bloc<InstructorDeletionEvent, InstructorDeletionState> {
  InstructorDeletionBloc() : super(const InstructorDeletionState.initial()) {
    on<InstructorDeletionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
