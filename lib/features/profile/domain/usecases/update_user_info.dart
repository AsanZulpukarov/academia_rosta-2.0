import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/core/usecases/usecase.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/user_info_entity.dart';
import 'package:academia_rosta_diplom/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateUserInfoUseCase extends UseCase<bool, UserInfoEntity> {
  final ProfileRepository profileRepository;

  UpdateUserInfoUseCase(this.profileRepository);
  @override
  Future<Either<Failure, bool>> call(UserInfoEntity params) async {
    return await profileRepository.updateUserInfo(params);
  }
}
