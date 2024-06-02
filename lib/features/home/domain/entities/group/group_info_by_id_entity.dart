import 'package:academia_rosta_diplom/features/home/domain/entities/group/student_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/subject_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/teacher_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/timetable_entity.dart';
import 'package:equatable/equatable.dart';

class GroupInfoByIdEntity extends Equatable {
  final int? id;
  final String? name;
  final TeacherEntity? teacher;
  final SubjectEntity? subject;
  final List<StudentEntity>? pupils;
  final TimetableEntity? timetable;

  const GroupInfoByIdEntity(
      {this.id,
      this.name,
      this.teacher,
      this.subject,
      this.pupils,
      this.timetable,});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        teacher,
        subject,
        pupils,
        timetable,
      ];
}
