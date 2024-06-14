import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/grade_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/attendance_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/create_hw_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/exercise_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/group_info_by_id_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/group_info_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/hw_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/lesson_entity.dart';
import 'package:dartz/dartz.dart';

abstract class GroupRepository {
  Future<Either<Failure, List<GroupInfoEntity>>> getAllGroups();
  Future<Either<Failure, List<GroupInfoEntity>>> getGroupsStudentId(int id);

  Future<Either<Failure, GroupInfoByIdEntity>> getGroupById({required int id});

  Future<Either<Failure, void>> postAttendanceStudents(AttendanceEntity attendanceEntity);

  Future<Either<Failure, List<LessonEntity>>> getAllLessonHistory(int id);

  Future<Either<Failure, List<ExerciseEntity>>> getExerciseByHWId(int id);

  Future<Either<Failure, void>> deleteHWById(int idHW);

  Future<Either<Failure, HWEntity>> createHWByStudentId(CreateHWEntity createHWEntity);

  Future<Either<Failure, List<HWEntity>>> getAllHWByStudentId(
      {required int idSubject, required int idStudent});
  Future<Either<Failure, List<HWEntity>>> getHWStudent(
      {required int idSubject});

  Future<Either<Failure, void>> deleteHWByStudentId();

  Future<Either<Failure, void>> postGradeByStudentsId(GradeEntity gradeEntity);
}
