import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/group_info_entity.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/app_repository.dart';

class GroupRepositoryImpl extends GroupRepository {
  GroupRepositoryImpl();

  @override
  Future<Either<Failure, List<GroupInfoEntity>>> getAllGroups() {
    // TODO: implement getAllGroups
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<GroupInfoEntity>>> getGroupById(
      {required String id}) {
    // TODO: implement getGroupById
    throw UnimplementedError();
  }
}
