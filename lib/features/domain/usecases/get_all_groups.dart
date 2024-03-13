import 'package:academia_rosta_diplom/core/usecases/usecase.dart';
import 'package:academia_rosta_diplom/features/domain/repositories/app_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/group/group_info_entity.dart';

class GetAllPersons extends UseCase<List<GroupInfoEntity>, Object> {
  final AppRepository appRepository;

  GetAllPersons(this.appRepository);

  @override
  Future<Either<Failure, List<GroupInfoEntity>>> call(Object params) async {
    return await appRepository.getAllGroups();
  }
}
