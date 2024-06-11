import 'package:academia_rosta_diplom/features/home/domain/entities/group/attendance_entity.dart';
import 'package:equatable/equatable.dart';

abstract class AttendanceEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AttendanceTapSaveEvent extends AttendanceEvent {
  final AttendanceEntity attendanceEntity;

  AttendanceTapSaveEvent({required this.attendanceEntity});
  @override
  // TODO: implement props
  List<Object?> get props => [attendanceEntity];
}
