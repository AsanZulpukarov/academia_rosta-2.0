import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/core/usecases/usecase.dart';
import 'package:academia_rosta_diplom/features/home/domain/repositories/group_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../entities/group/group_info_entity.dart';

class GetGroupById extends UseCase<List<GroupInfoEntity>, GetGroupByIdParams> {
  final GroupRepository appRepository;

  GetGroupById(this.appRepository);

  @override
  Future<Either<Failure, List<GroupInfoEntity>>> call(
      GetGroupByIdParams params) async {
    return await appRepository.getGroupById(id: params.query);
  }
}

class GetGroupByIdParams extends Equatable {
  final String query;

  const GetGroupByIdParams({required this.query});
  @override
  // TODO: implement props
  List<Object?> get props => [query];
}
