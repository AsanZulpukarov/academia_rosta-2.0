import 'package:academia_rosta_diplom/features/domain/entities/group/group_info_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

abstract class AppRepository {
  Future<Either<Failure, List<GroupInfoEntity>>> getAllGroups();
  Future<Either<Failure, List<GroupInfoEntity>>> getGroupById(
      {required String id});
}
