import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/core/usecases/usecase.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/mark_entity.dart';
import 'package:academia_rosta_diplom/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetStudentStatisticUseCase extends UseCase<Map<String, MarkEntity>, GetStudentStatistic> {
  final ProfileRepository profileRepository;

  GetStudentStatisticUseCase(this.profileRepository);

  @override
  Future<Either<Failure, Map<String, MarkEntity>>> call(GetStudentStatistic params) async {
    return await profileRepository.getStudentStatistic(params.subjectId, params.studentId);
  }
}

class GetStudentStatistic extends Equatable{
  final int subjectId;
  final int studentId;

  const GetStudentStatistic({required this.subjectId, required this.studentId});
  @override
  // TODO: implement props
  List<Object?> get props => [subjectId,studentId,];

}
