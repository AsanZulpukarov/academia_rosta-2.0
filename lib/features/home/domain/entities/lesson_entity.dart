import 'package:academia_rosta_diplom/features/profile/domain/entities/user_info_entity.dart';
import 'package:equatable/equatable.dart';

class LessonEntity extends Equatable {
  final int id;
  final DateTime createLesson;
  final List<UserInfoEntity> students;
  final bool isAttendance;

  const LessonEntity({
    required this.id,
    required this.createLesson,
    required this.students,
    required this.isAttendance,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        createLesson,
        students,
        isAttendance,
      ];
}
