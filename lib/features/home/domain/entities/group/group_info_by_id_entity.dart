import 'package:academia_rosta_diplom/features/home/domain/entities/group/student_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/subject_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/teacher_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/timetable_entity.dart';
import 'package:equatable/equatable.dart';

class GroupInfoByIdEntity extends Equatable {
  int? id;
  String? name;
  TeacherEntity? teacher;
  SubjectEntity? subject;
  List<StudentEntity>? pupils;
  TimetableEntity? timetable;

  GroupInfoByIdEntity(
      {this.id,
      this.name,
      this.teacher,
      this.subject,
      this.pupils,
      this.timetable});

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
