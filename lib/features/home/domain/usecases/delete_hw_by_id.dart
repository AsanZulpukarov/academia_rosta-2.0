import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/core/usecases/usecase.dart';
import 'package:academia_rosta_diplom/features/home/domain/repositories/group_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteHWByIdUseCase extends UseCase<void, int> {
  final GroupRepository appRepository;

  DeleteHWByIdUseCase(this.appRepository);

  @override
  Future<Either<Failure, void>> call(int params) async {
    return await appRepository.deleteHWById(params);
  }
}
