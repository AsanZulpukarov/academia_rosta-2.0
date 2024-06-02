import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/core/usecases/usecase.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/hw_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/repositories/group_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetAllHWByStudentIdUseCase extends UseCase<void, HWParams> {
  final GroupRepository appRepository;

  GetAllHWByStudentIdUseCase(this.appRepository);

  @override
  Future<Either<Failure, List<HWEntity>>> call(HWParams params) async {
    return await appRepository.getAllHWByStudentId(
        idSubject: params.subjectId, idStudent: params.studentId);
  }
}

class HWParams extends Equatable {
  final int subjectId;
  final int studentId;

  const HWParams({
    required this.subjectId,
    required this.studentId,
  });

  @override
  List<Object> get props => [subjectId, studentId];
}
