import 'package:academia_rosta_diplom/features/home/data/models/group_info_by_id_model.dart';
import 'package:academia_rosta_diplom/features/home/data/models/group_info_model.dart';

abstract class GroupRemoteDataSource {
  Future<List<GroupInfoModel>> getAllGroups();
  Future<GroupInfoByIdModel> getGroupById(String id);
}
