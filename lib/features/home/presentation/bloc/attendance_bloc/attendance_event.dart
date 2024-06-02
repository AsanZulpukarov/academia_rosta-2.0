import 'package:equatable/equatable.dart';

abstract class AttendanceEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AttendanceTapSaveEvent extends AttendanceEvent {}

class AttendanceStudentCheckboxTapEvent extends AttendanceEvent {
  final int index;
  final bool isSelect;

  AttendanceStudentCheckboxTapEvent(this.index, this.isSelect);

  @override
  // TODO: implement props
  List<Object?> get props => [index, isSelect];
}

class AttendanceLastThreeLessonEmptyEvent extends AttendanceEvent {}
