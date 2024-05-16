import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/core/usecases/usecase.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/group_info_by_id_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/repositories/group_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetGroupByIdUseCase
    extends UseCase<GroupInfoByIdEntity, int> {
  final GroupRepository appRepository;

  GetGroupByIdUseCase(this.appRepository);

  @override
  Future<Either<Failure, GroupInfoByIdEntity>> call(
      int params) async {
    return await appRepository.getGroupById(id: params);
  }
}