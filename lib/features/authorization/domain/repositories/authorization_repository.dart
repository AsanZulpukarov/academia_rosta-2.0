import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/features/authorization/data/models/sign_in_model.dart';
import 'package:academia_rosta_diplom/features/authorization/data/models/sign_up_model.dart';
import 'package:academia_rosta_diplom/features/authorization/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthorizationRepository {
  Future<Either<Failure, UserModel>> signIn(SignInModel signInModel);
  Future<Either<Failure, void>> signUp(SignUpModel signUpModel);
  Future<Either<Failure, void>> resetPassword(String username);
  Future<Either<Failure, void>> sendCode(String code);
}
