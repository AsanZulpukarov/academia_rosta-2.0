import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/features/profile/data/models/edit_password_model.dart';
import 'package:academia_rosta_diplom/features/profile/data/models/user_info_model.dart';
import 'package:academia_rosta_diplom/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  ProfileRepositoryImpl();

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
  Future<Either<Failure, void>> resetPassword(
      EditPasswordModel editPasswordModel) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateUserInfo(UserInfoModel userInfoModel) {
    // TODO: implement setUserInfo
    throw UnimplementedError();
  }
}
