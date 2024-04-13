import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/features/trainer/data/datasources/local/trainer_local_data_source.dart';
import 'package:academia_rosta_diplom/features/trainer/data/datasources/remote/trainer_remote_data_source.dart';
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
}
