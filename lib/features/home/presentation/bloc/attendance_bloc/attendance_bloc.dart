import 'package:academia_rosta_diplom/features/home/domain/entities/group/student_entity.dart';
import 'package:academia_rosta_diplom/features/home/presentation/bloc/attendance_bloc/attendance_event.dart';
import 'package:academia_rosta_diplom/features/home/presentation/bloc/attendance_bloc/attendance_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  final List<StudentEntity> students = [];

  AttendanceBloc() : super(AttendanceInitialState()) {
    on<AttendanceTapSaveEvent>(_onAttendanceTapSaveEvent);
    on<AttendanceLastThreeLessonEmptyEvent>(
        _onAttendanceLastThreeLessonEmptyEvent);
    on(_onAttendanceStudentCheckboxTapEvent);
  }

  _onAttendanceTapSaveEvent(
      AttendanceTapSaveEvent event, Emitter<AttendanceState> emit) {
    emit(AttendanceInitialState());
  }

  _onAttendanceStudentCheckboxTapEvent(
      AttendanceStudentCheckboxTapEvent event, Emitter<AttendanceState> emit) {
    students.elementAt(event.index).isAttended = event.isSelect;
  }

  _onAttendanceLastThreeLessonEmptyEvent(
      AttendanceLastThreeLessonEmptyEvent event,
      Emitter<AttendanceState> emit) {}
}
