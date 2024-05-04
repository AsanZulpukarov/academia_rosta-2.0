import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/features/profile/data/datasources/remote/profile_remote_data_source.dart';
import 'package:academia_rosta_diplom/features/profile/data/models/user_info_model.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/edit_password_entity.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/user_info_entity.dart';
import 'package:academia_rosta_diplom/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  ProfileRemoteDataSource profileRemoteDataSource;
  ProfileRepositoryImpl({required this.profileRemoteDataSource});

  @override
  Future<Either<Failure, void>> getMyStatistic() {
    // TODO: implement getMyStatistic
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserInfoModel>> getUserInfo() {
    // TODO: implement getUserInfo
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> logoutAccount() {
    // TODO: implement logoutAccount
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> changePassword(EditPasswordEntity editPasswordEntity) async {
    try {
      return Right(await profileRemoteDataSource.editPassword(editPasswordEntity));
    } on Exception {
      throw ServerFailure();
    }
  }

  @override
  Future<Either<Failure, void>> updateUserInfo(UserInfoEntity userInfoEntity) {
    // TODO: implement setUserInfo
    throw UnimplementedError();
  }
}
