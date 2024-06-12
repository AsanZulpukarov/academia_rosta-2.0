import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/core/usecases/usecase.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/exercise_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/repositories/group_repository.dart';
import 'package:dartz/dartz.dart';

class GetExerciseByHWIdUseCase extends UseCase<List<ExerciseEntity>, int> {
  final GroupRepository appRepository;

  GetExerciseByHWIdUseCase(this.appRepository);

  @override
  Future<Either<Failure, List<ExerciseEntity>>> call(int params) async {
    return await appRepository.getExerciseByHWId(params);
  }
}
