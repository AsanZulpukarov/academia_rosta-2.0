import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/core/usecases/usecase.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/grade_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/repositories/group_repository.dart';
import 'package:dartz/dartz.dart';

class PostGradeByStudentIdUseCase extends UseCase<void, GradeEntity> {
  final GroupRepository appRepository;

  PostGradeByStudentIdUseCase(this.appRepository);

  @override
  Future<Either<Failure, void>> call(GradeEntity params) async {
    return await appRepository.postGradeByStudentsId(params);
  }
}
