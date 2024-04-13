import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/features/authorization/data/models/sign_in_model.dart';
import 'package:academia_rosta_diplom/features/authorization/data/models/sign_up_model.dart';
import 'package:academia_rosta_diplom/features/authorization/data/models/user_model.dart';
import 'package:academia_rosta_diplom/features/authorization/domain/repositories/authorization_repository.dart';
import 'package:dartz/dartz.dart';

class AuthorizationRepositoryImpl extends AuthorizationRepository {
  AuthorizationRepositoryImpl();

  @override
  Future<Either<Failure, void>> resetPassword(String username) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> sendCode(String code) {
    // TODO: implement sendCode
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> signUp(SignUpModel signUpModel) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserModel>> signIn(SignInModel signInModel) async {
    return Left(ServerFailure());
  }
}
