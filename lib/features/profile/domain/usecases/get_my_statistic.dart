import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/core/usecases/usecase.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/mark_entity.dart';
import 'package:academia_rosta_diplom/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class GetMyStatisticUseCase extends UseCase<Map<String, MarkEntity>, int> {
  final ProfileRepository profileRepository;

  GetMyStatisticUseCase(this.profileRepository);

  @override
  Future<Either<Failure, Map<String, MarkEntity>>> call(int params) async {
    return await profileRepository.getMyStatistic(params);
  }
}
