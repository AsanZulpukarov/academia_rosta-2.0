import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/core/usecases/usecase.dart';
import 'package:academia_rosta_diplom/features/home/data/models/subject_model.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/subject_entity.dart';
import 'package:academia_rosta_diplom/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class GetMySubjectsUseCase extends UseCase<List<SubjectEntity>, Object> {
  final ProfileRepository profileRepository;

  GetMySubjectsUseCase(this.profileRepository);
  @override
  Future<Either<Failure, List<SubjectEntity>>> call(Object params) async {
    return await profileRepository.getMySubjects();
  }
}
