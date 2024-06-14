import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/core/platform/network_info.dart';
import 'package:academia_rosta_diplom/features/home/data/datasources/remote/group_remote_data_source.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/grade_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/attendance_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/create_hw_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/exercise_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/group_info_by_id_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/group_info_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/hw_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/lesson_entity.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/group_repository.dart';

class GroupRepositoryImpl extends GroupRepository {
  GroupRemoteDataSource remoteGroupDataSource;

  GroupRepositoryImpl({
    required this.remoteGroupDataSource,
  });

  @override
  Future<Either<Failure, List<GroupInfoEntity>>> getAllGroups() async {
    try {
      return Right(await remoteGroupDataSource.getAllGroups());
    } on Exception catch (e){
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, GroupInfoByIdEntity>> getGroupById(
      {required int id}) async {
    try {
      return Right(await remoteGroupDataSource.getGroupById(id));
    } on Exception catch (e){
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, HWEntity>> createHWByStudentId(CreateHWEntity createHWEntity) async {
    try {
      return Right(await remoteGroupDataSource.createHWByStudentId(createHWEntity));
    } on Exception catch (e){
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteHWById(int idHW) async {
    try {
      return Right(await remoteGroupDataSource.deleteHWById(idHW));
    } on Exception catch (e){
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteHWByStudentId() async {
    try {
      return Right(await remoteGroupDataSource.deleteHWByStudentId());
    } on Exception catch (e){
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<LessonEntity>>> getAllLessonHistory(
      int id) async {
    try {
      return Right(await remoteGroupDataSource.getAllLessonHistory(id));
    } on Exception catch (e){
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> postAttendanceStudents(AttendanceEntity attendanceEntity) async {
    try {
      return Right(await remoteGroupDataSource.postAttendanceStudents(attendanceEntity));
    } on Exception catch (e){
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> postGradeByStudentsId(GradeEntity gradeEntity) async {
    // TODO: implement postGradeByStudentsId

    try {
      return Right(await remoteGroupDataSource.postGradeByStudentsId(gradeEntity));
    } on Failure catch (e){
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<HWEntity>>> getAllHWByStudentId(
      {required int idSubject, required int idStudent}) async {
    try {
      return Right(await remoteGroupDataSource.getAllHWByStudentId(
          idStudent: idStudent, idSubject: idSubject));
    } on Exception catch (e){
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ExerciseEntity>>> getExerciseByHWId(
      int id) async {
    try {
      return Right(await remoteGroupDataSource.getExerciseByHWId(id));
    } on Exception catch (e){
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<GroupInfoEntity>>> getGroupsStudentId(int id) async {
    try {
      return Right(await remoteGroupDataSource.getGroupsStudentId(id));
    } on Exception catch (e){
    return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<HWEntity>>> getHWStudent({required int idSubject}) async {
    try {
      return Right(await remoteGroupDataSource.getHWStudent(idSubject: idSubject));
    } on Exception catch (e){
    return Left(ServerFailure(message: e.toString()));
    }
  }
}
