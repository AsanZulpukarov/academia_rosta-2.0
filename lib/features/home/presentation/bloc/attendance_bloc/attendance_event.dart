import 'package:equatable/equatable.dart';

abstract class AttendanceEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AttendanceTapSaveEvent extends AttendanceEvent {}
