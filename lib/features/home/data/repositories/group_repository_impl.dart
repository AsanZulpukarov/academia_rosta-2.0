import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/core/platform/network_info.dart';
import 'package:academia_rosta_diplom/features/home/data/datasources/remote/group_remote_data_source.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/group_info_by_id_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/group_info_entity.dart';

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
  Future<Either<Failure, void>> createHWByStudentId() {
    // TODO: implement createHWByStudentId
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteHWById() {
    // TODO: implement deleteHWById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteHWByStudentId() {
    // TODO: implement deleteHWByStudentId
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> getAllHW() {
    // TODO: implement getAllHW
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> getAllHWByStudentId() {
    // TODO: implement getAllHWByStudentId
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> getAllLessonHistory() {
    // TODO: implement getAllLessonHistory
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> getLastThreeLessonHistory() {
    // TODO: implement getLastThreeLessonHistory
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> postAttendanceStudents() {
    // TODO: implement postAttendanceStudents
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> postGradeByStudentsId() {
    // TODO: implement postGradeByStudentsId
    throw UnimplementedError();
  }
}
