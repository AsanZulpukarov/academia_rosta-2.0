import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/features/trainer/data/datasources/local/trainer_local_data_source.dart';
import 'package:academia_rosta_diplom/features/trainer/data/datasources/remote/trainer_remote_data_source.dart';
import 'package:academia_rosta_diplom/features/trainer/data/datasources/trainer_service.dart';
import 'package:academia_rosta_diplom/features/trainer/domain/entities/exercise_train_entity.dart';
import 'package:academia_rosta_diplom/features/trainer/domain/repositories/trainer_repository.dart';
import 'package:dartz/dartz.dart';

class TrainerRepositoryImpl extends TrainerRepository {
  final TrainerRemoteDataSource trainerRemoteDataSource;
  final TrainerLocalDataSource trainerLocalDataSource;
  TrainerRepositoryImpl({
    required this.trainerRemoteDataSource,
    required this.trainerLocalDataSource,
  });

  @override
  Future<Either<Failure, void>> saveResultTrainer() {
    // TODO: implement saveResultTrainer
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<int>>> getNumberArray(
      ExerciseTrainEntity exerciseTrainEntity) async {
    try {
      return Right(TrainerService().getArray(
          exerciseTrainEntity.topic ?? "ПСВ",
          exerciseTrainEntity.digitsCount ?? 1,
          exerciseTrainEntity.numberCount ?? 1,),);
    } on Exception {
      throw Left(ServerFailure());
    }
  }
}
