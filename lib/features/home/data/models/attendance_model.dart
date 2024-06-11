import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/attendance_entity.dart';
import 'package:intl/intl.dart';

class AttendanceModel extends AttendanceEntity {
  const AttendanceModel({
    required super.idGroup,
    required super.selectDate,
    required super.attendance,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return AttendanceModel(
      idGroup: json['idSubject'],
      selectDate: DateTime.parse(json['selectDate']),
      attendance: json['attendance'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> formattedAttendance = attendance.map((key, value) =>
        MapEntry(key.toString(), value));
    return {
      'groupId': idGroup,
      'date': DateFormat('yyyy-MM-dd').format(selectDate),
      'attendance': formattedAttendance,
    };
  }
}
