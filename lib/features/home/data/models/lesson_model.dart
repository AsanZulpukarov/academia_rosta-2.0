import 'package:academia_rosta_diplom/features/home/domain/entities/lesson_entity.dart';
import 'package:academia_rosta_diplom/features/profile/data/models/user_info_model.dart';

class LessonModel extends LessonEntity {
  const LessonModel(
      {required super.id,
      required super.createLesson,
      required super.students,
      required super.isAttendance});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createLesson': createLesson.toIso8601String(),
      'students': students
          .map(
            (student) => UserInfoModel(
                firstname: student.firstname,
                lastname: student.lastname,
                email: student.email,
                username: student.username,
                phoneNumber: student.phoneNumber),
          )
          .toList(),
      'isAttendance': isAttendance,
    };
  }

  // Factory method to deserialize JSON to LessonEntity
  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      id: json['id'],
      createLesson: DateTime.parse(json['createLesson']),
      students: (json['students'] as List<dynamic>)
          .map((studentJson) => UserInfoModel.fromJson(studentJson))
          .toList(),
      isAttendance: json['isAttendance'],
    );
  }
}
