import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/features/profile/data/models/edit_password_model.dart';
import 'package:academia_rosta_diplom/features/profile/data/models/user_info_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserInfoModel>> getUserInfo();
  Future<Either<Failure, void>> updateUserInfo(UserInfoModel userInfoModel);
  Future<Either<Failure, void>> changePassword(
      EditPasswordModel editPasswordModel);
  Future<Either<Failure, void>> getMyStatistic();
  Future<Either<Failure, void>> logoutAccount();
}
