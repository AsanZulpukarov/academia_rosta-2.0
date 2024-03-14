import 'package:academia_rosta_diplom/features/profile/data/models/edit_password_model.dart';
import 'package:academia_rosta_diplom/features/profile/data/models/user_info_model.dart';

abstract class ProfileRemoteDataSource {
  Future<UserInfoModel> getUserInfo();
  Future<void> updateUserInfo(UserInfoModel userInfoModel);
  Future<void> editPassword(EditPasswordModel editPasswordModel);
  Future<void> getMyStatistic();
  Future<void> logoutAccount();
}
