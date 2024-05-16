import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/features/authorization/data/datasources/remote/authorization_remote_data_source.dart';
import 'package:academia_rosta_diplom/features/authorization/data/datasources/remote/authorization_remote_data_source_impl.dart';
import 'package:academia_rosta_diplom/features/authorization/data/models/sign_in_model.dart';
import 'package:academia_rosta_diplom/features/authorization/data/models/sign_up_model.dart';
import 'package:academia_rosta_diplom/features/authorization/data/models/user_model.dart';
import 'package:academia_rosta_diplom/features/authorization/domain/repositories/authorization_repository.dart';
import 'package:dartz/dartz.dart';

class AuthorizationRepositoryImpl extends AuthorizationRepository {
  AuthorizationRemoteDataSource authorizationRemoteDataSource;
  AuthorizationRepositoryImpl({required this.authorizationRemoteDataSource});

  @override
  Future<Either<Failure, void>> resetPassword(String username) async{
    try {
      return Right(await authorizationRemoteDataSource.resetPassword(username));
    } on Failure{

    throw Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> sendCode(String code) async{
    try {
      return Right(await authorizationRemoteDataSource.sendCode(code));
    } on Failure{

    throw Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signUp(SignUpModel signUpModel) async {
    try {
      return Right(await authorizationRemoteDataSource.signUp(signUpModel));
    } on Failure{

      throw Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserModel>> signIn(SignInModel signInModel) async {
    try {
      AuthorizationRemoteDataSourceImpl authorizationRemoteDataSourceImpl = AuthorizationRemoteDataSourceImpl();
      return Right(await authorizationRemoteDataSourceImpl.signIn(signInModel));
    } on Failure{

      throw Left(ServerFailure());
    }
  }
}
