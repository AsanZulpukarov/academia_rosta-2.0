import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/core/usecases/usecase.dart';
import 'package:academia_rosta_diplom/features/trainer/domain/repositories/trainer_repository.dart';
import 'package:dartz/dartz.dart';

class SaveResultTrainerUseCase extends UseCase<void, Object> {
  final TrainerRepository trainerRepository;

  SaveResultTrainerUseCase(this.trainerRepository);
  @override
  Future<Either<Failure, void>> call(Object params) async {
    return await trainerRepository.saveResultTrainer();
  }
}
