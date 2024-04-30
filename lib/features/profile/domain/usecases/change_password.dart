import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/core/usecases/usecase.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/edit_password_entity.dart';
import 'package:academia_rosta_diplom/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class ChangePasswordUseCase extends UseCase<void, EditPasswordEntity> {
  final ProfileRepository profileRepository;

  ChangePasswordUseCase(this.profileRepository);
  @override
  Future<Either<Failure, void>> call(EditPasswordEntity params) async {
    return await profileRepository.changePassword(params);
  }
}
