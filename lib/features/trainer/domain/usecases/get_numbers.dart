import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/core/usecases/usecase.dart';
import 'package:academia_rosta_diplom/features/trainer/domain/entities/exercise_train_entity.dart';
import 'package:academia_rosta_diplom/features/trainer/domain/repositories/trainer_repository.dart';
import 'package:dartz/dartz.dart';

class GetNumbersUseCase extends UseCase<void, ExerciseTrainEntity> {
  final TrainerRepository trainerRepository;

  GetNumbersUseCase(this.trainerRepository);

  @override
  Future<Either<Failure, List<int>>> call(ExerciseTrainEntity params) async {
    return await trainerRepository.getNumberArray(params);
  }
}
