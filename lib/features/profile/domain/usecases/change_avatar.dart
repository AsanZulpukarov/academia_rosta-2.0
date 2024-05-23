import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/core/usecases/usecase.dart';
import 'package:academia_rosta_diplom/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class ChangeAvatarUseCase extends UseCase<void,String>{
  final ProfileRepository profileRepository;

  ChangeAvatarUseCase(this.profileRepository);
  @override
  Future<Either<Failure, void>> call(String params) async{
    return await profileRepository.changeAvatar(params);
  }
}