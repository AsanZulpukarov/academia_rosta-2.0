import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/core/usecases/usecase.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/lesson_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/repositories/group_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllLessonHistoryUseCase extends UseCase<List<LessonEntity>, int> {
  GroupRepository repository;

  GetAllLessonHistoryUseCase(this.repository);

  @override
  Future<Either<Failure, List<LessonEntity>>> call(int params) async {
    return await repository.getAllLessonHistory(params);
  }
}
