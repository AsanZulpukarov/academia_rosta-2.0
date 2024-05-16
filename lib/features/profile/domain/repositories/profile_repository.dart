import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/edit_password_entity.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/user_info_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserInfoEntity>> getUserInfo();
  Future<Either<Failure, bool>> updateUserInfo(UserInfoEntity userInfoEntity);
  Future<Either<Failure, bool>> changePassword(
      EditPasswordEntity editPasswordEntity);
  Future<Either<Failure, void>> getMyStatistic();
  Future<Either<Failure, void>> logoutAccount();
}
