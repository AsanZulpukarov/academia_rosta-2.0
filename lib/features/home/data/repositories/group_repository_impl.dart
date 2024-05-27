import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/core/platform/network_info.dart';
import 'package:academia_rosta_diplom/features/home/data/datasources/remote/group_remote_data_source.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/group_info_by_id_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/group_info_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/lesson_entity.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/group_repository.dart';

class GroupRepositoryImpl extends GroupRepository {
  GroupRemoteDataSource remoteGroupDataSource;
  final NetworkInfo networkInfo;
  GroupRepositoryImpl({
    required this.remoteGroupDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<GroupInfoEntity>>> getAllGroups() async {
    try {
      return Right(await remoteGroupDataSource.getAllGroups());
    } on Exception{
      return throw Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, GroupInfoByIdEntity>> getGroupById(
      {required int id}) async {
    try {
      return Right(await remoteGroupDataSource.getGroupById(id));
    } on Exception{
    return throw Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> createHWByStudentId() async {
    try {
      return Right(await remoteGroupDataSource.createHWByStudentId());
    } on Exception{
    return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteHWById() async {
    try {
      return Right(await remoteGroupDataSource.deleteHWById());
    } on Exception{
    return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteHWByStudentId() async {
    try {
      return Right(await remoteGroupDataSource.deleteHWByStudentId());
    } on Exception{
    return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> getAllHW() async {
    try {
      return Right(await remoteGroupDataSource.getAllHW());
    } on Exception{
    return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<LessonEntity>>> getAllLessonHistory(int id) async {

    try {
      return Right(await remoteGroupDataSource.getAllLessonHistory(id));
    } on Exception{
    return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> getLastThreeLessonHistory() async {
    // TODO: implement getLastThreeLessonHistory
    
    try {
      return Right(await remoteGroupDataSource.getLastThreeLessonHistory());
    } on Exception{
    return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> postAttendanceStudents() async {
    // TODO: implement postAttendanceStudents
    
    try {
      return Right(await remoteGroupDataSource.postAttendanceStudents());
    } on Exception{
    return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> postGradeByStudentsId() async {
    // TODO: implement postGradeByStudentsId
    
    try {
      return Right(await remoteGroupDataSource.postGradeByStudentsId());
    } on Exception{
    return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> getAllHWByStudentId() async {
    try {
      return Right(await remoteGroupDataSource.getAllHWByStudentId());
    } on Exception{
    return Left(ServerFailure());
    }
  }
}
