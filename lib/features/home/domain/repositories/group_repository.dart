import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/group_info_by_id_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/group_info_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/lesson_entity.dart';
import 'package:dartz/dartz.dart';

abstract class GroupRepository {
  Future<Either<Failure, List<GroupInfoEntity>>> getAllGroups();
  Future<Either<Failure, GroupInfoByIdEntity>> getGroupById(
      {required int id});

  Future<Either<Failure, void>> postAttendanceStudents();
  Future<Either<Failure, void>> getLastThreeLessonHistory();
  Future<Either<Failure, List<LessonEntity>>> getAllLessonHistory(int params);
  Future<Either<Failure, void>> getAllHW();
  Future<Either<Failure, void>> deleteHWById();
  Future<Either<Failure, void>> createHWByStudentId();
  Future<Either<Failure, void>> getAllHWByStudentId();
  Future<Either<Failure, void>> deleteHWByStudentId();
  Future<Either<Failure, void>> postGradeByStudentsId();
}
