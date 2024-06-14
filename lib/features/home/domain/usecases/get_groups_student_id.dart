import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/core/usecases/usecase.dart';
import 'package:academia_rosta_diplom/features/home/domain/repositories/group_repository.dart';
import 'package:dartz/dartz.dart';
import '../entities/group/group_info_entity.dart';

class GetGroupsStudentIdUseCase extends UseCase<List<GroupInfoEntity>, int> {
  final GroupRepository appRepository;

  GetGroupsStudentIdUseCase(this.appRepository);

  @override
  Future<Either<Failure, List<GroupInfoEntity>>> call(int params) async {
    return await appRepository.getGroupsStudentId(params);
  }
}
