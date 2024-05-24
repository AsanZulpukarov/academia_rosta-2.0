import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/subject_entity.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/edit_password_entity.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/mark_entity.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/user_info_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserInfoEntity>> getUserInfo();
  Future<Either<Failure, bool>> updateUserInfo(UserInfoEntity userInfoEntity);
  Future<Either<Failure, bool>> changePassword(
      EditPasswordEntity editPasswordEntity);
  Future<Either<Failure,  Map<String,MarkEntity>>> getMyStatistic(int id);
  Future<Either<Failure, List<SubjectEntity>>> getMySubjects();
  Future<Either<Failure, void>> logoutAccount();
  Future<Either<Failure, void>> changeAvatar(int avatar);
}
