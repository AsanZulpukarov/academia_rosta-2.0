import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/core/usecases/usecase.dart';
import 'package:academia_rosta_diplom/features/authorization/data/models/sign_in_model.dart';
import 'package:academia_rosta_diplom/features/authorization/data/models/user_model.dart';
import 'package:academia_rosta_diplom/features/authorization/domain/entities/sign_in_entity.dart';
import 'package:academia_rosta_diplom/features/authorization/domain/repositories/authorization_repository.dart';
import 'package:dartz/dartz.dart';

class SignInUseCase extends UseCase<UserModel, SignInEntity> {
  final AuthorizationRepository authorizationRepository;

  SignInUseCase({required this.authorizationRepository});

  @override
  Future<Either<Failure, UserModel>> call(SignInEntity params) async {
    return await authorizationRepository.signIn(
        SignInModel(username: params.username, password: params.password));
  }
}
