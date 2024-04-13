import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/core/usecases/usecase.dart';
import 'package:academia_rosta_diplom/features/home/domain/repositories/group_repository.dart';
import 'package:dartz/dartz.dart';

class CreateHWByStudentIdUseCase extends UseCase<void, Object> {
  final GroupRepository appRepository;

  CreateHWByStudentIdUseCase(this.appRepository);

  @override
  Future<Either<Failure, void>> call(Object params) async {
    return await appRepository.createHWByStudentId();
  }
}
