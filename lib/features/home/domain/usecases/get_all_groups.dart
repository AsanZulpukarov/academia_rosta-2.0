import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/core/usecases/usecase.dart';
import 'package:academia_rosta_diplom/features/home/domain/repositories/group_repository.dart';
import 'package:dartz/dartz.dart';
import '../entities/group/group_info_entity.dart';

class GetAllPersons extends UseCase<List<GroupInfoEntity>, Object> {
  final GroupRepository appRepository;

  GetAllPersons(this.appRepository);

  @override
  Future<Either<Failure, List<GroupInfoEntity>>> call(Object params) async {
    return await appRepository.getAllGroups();
  }
}
