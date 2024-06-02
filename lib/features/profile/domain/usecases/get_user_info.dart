import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/core/usecases/usecase.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/user_info_entity.dart';
import 'package:academia_rosta_diplom/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class GetUserInfoUseCase extends UseCase<UserInfoEntity, Object> {
  final ProfileRepository profileRepository;

  GetUserInfoUseCase(this.profileRepository);

  @override
  Future<Either<Failure, UserInfoEntity>> call(Object params) async {
    return await profileRepository.getUserInfo();
  }
}
