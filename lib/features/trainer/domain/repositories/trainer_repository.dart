import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class TrainerRepository {
  Future<Either<Failure, void>> saveResultTrainer();
}
