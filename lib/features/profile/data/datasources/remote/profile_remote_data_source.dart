import 'package:academia_rosta_diplom/features/home/data/models/subject_model.dart';
import 'package:academia_rosta_diplom/features/profile/data/models/user_info_model.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/edit_password_entity.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/mark_entity.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/user_info_entity.dart';

abstract class ProfileRemoteDataSource {
  Future<UserInfoModel> getUserInfo();
  Future<bool> updateUserInfo(UserInfoEntity userInfoEntity);
  Future<bool> editPassword(EditPasswordEntity editPasswordEntity);
  Future< Map<String,MarkEntity>> getMyStatistic(int id);
  Future<List<SubjectModel>> getMySubjects();
  Future<void> logoutAccount();
  Future<void> changeAvatar(int avatar);
}
