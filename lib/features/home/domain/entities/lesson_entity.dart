import 'package:academia_rosta_diplom/features/home/domain/entities/group/student_entity.dart';
import 'package:equatable/equatable.dart';

class LessonEntity extends Equatable {
  final int? id;
  final DateTime? createLesson;
  final List<StudentEntity>? students;

  const LessonEntity({
    required this.id,
    required this.createLesson,
    required this.students,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        createLesson,
        students,
      ];
}
