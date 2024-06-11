import 'package:equatable/equatable.dart';

class AttendanceEntity extends Equatable {
  final int idGroup;
  final DateTime selectDate;
  final Map<int, bool> attendance;

  const AttendanceEntity({
    required this.idGroup,
    required this.selectDate,
    required this.attendance,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        idGroup,
        selectDate,
        attendance,
      ];
}
