import 'package:equatable/equatable.dart';

abstract class AttendanceState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AttendanceInitialState extends AttendanceState {}

class AttendanceLoadingState extends AttendanceState {}

class AttendanceStudentCheckboxState extends AttendanceState {}

class AttendanceSavedState extends AttendanceState {}

class AttendanceLastThreeLessonLoadedState extends AttendanceState {}

class AttendanceErrorState extends AttendanceState {
  String message;

  AttendanceErrorState(this.message);
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
