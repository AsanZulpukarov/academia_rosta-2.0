import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/core/usecases/usecase.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/create_hw_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/hw_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/repositories/group_repository.dart';
import 'package:dartz/dartz.dart';

class CreateHWUseCase extends UseCase<HWEntity, CreateHWEntity> {
  final GroupRepository appRepository;

  CreateHWUseCase(this.appRepository);

  @override
  Future<Either<Failure, HWEntity>> call(CreateHWEntity params) async {
    return await appRepository.createHWByStudentId(params);
  }
}
