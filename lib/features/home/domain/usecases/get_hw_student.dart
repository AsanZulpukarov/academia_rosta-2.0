import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/core/usecases/usecase.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/hw_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/repositories/group_repository.dart';
import 'package:dartz/dartz.dart';
import '../entities/group/group_info_entity.dart';

class GetHWStudentUseCase extends UseCase<List<HWEntity>, int> {
  final GroupRepository appRepository;

  GetHWStudentUseCase(this.appRepository);

  @override
  Future<Either<Failure, List<HWEntity>>> call(int params) async {
    return await appRepository.getHWStudent(idSubject: params);
  }
}
