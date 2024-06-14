import 'package:academia_rosta_diplom/features/home/data/models/student_model.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/lesson_entity.dart';

class LessonModel extends LessonEntity {
  const LessonModel({
    required super.id,
    required super.createLesson,
    required super.students,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      id: json['id'],
      createLesson: DateTime.fromMillisecondsSinceEpoch(json['date']),
      students: json['students'] != null
          ? (json['students'] as List<dynamic>)
              .map((studentJson) => StudentModel.fromJson(studentJson))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': createLesson,
      'students': students
          ?.map(
            (student) => StudentModel(
              firstname: student.firstname,
              lastname: student.lastname,
              id: student.id,
              phoneNumber: student.phoneNumber,
              birthday: student.birthday,
              email: student.email,
            ),
          )
          .toList(),
    };
  }
}
