import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/core/usecases/usecase.dart';
import 'package:academia_rosta_diplom/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class GetMyStatisticUseCase extends UseCase<void, Object> {
  final ProfileRepository profileRepository;

  GetMyStatisticUseCase(this.profileRepository);
  @override
  Future<Either<Failure, void>> call(Object params) async {
    return await profileRepository.getMyStatistic();
  }
}
