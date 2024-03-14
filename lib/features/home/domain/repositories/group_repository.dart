import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/group_info_entity.dart';
import 'package:dartz/dartz.dart';

abstract class GroupRepository {
  Future<Either<Failure, List<GroupInfoEntity>>> getAllGroups();
  Future<Either<Failure, List<GroupInfoEntity>>> getGroupById(
      {required String id});
}
