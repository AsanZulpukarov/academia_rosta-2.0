import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/features/trainer/domain/entities/exercise_train_entity.dart';
import 'package:dartz/dartz.dart';

abstract class TrainerRepository {
  Future<Either<Failure, void>> saveResultTrainer();
  Future<Either<Failure, List<int>>> getNumberArray(
      ExerciseTrainEntity exerciseTrainEntity);
}
