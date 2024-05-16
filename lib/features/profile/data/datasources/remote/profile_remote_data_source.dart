import 'package:academia_rosta_diplom/features/profile/data/models/user_info_model.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/edit_password_entity.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/user_info_entity.dart';

abstract class ProfileRemoteDataSource {
  Future<UserInfoModel> getUserInfo();
  Future<void> updateUserInfo(UserInfoEntity userInfoEntity);
  Future<void> editPassword(EditPasswordEntity editPasswordEntity);
  Future<void> getMyStatistic();
  Future<void> logoutAccount();
}
