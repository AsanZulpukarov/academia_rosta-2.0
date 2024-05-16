import 'package:academia_rosta_diplom/features/home/data/models/group_info_by_id_model.dart';
import 'package:academia_rosta_diplom/features/home/data/models/group_info_model.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/group_info_by_id_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/group_info_entity.dart';

abstract class GroupRemoteDataSource {
  Future<List<GroupInfoEntity>> getAllGroups();
  Future<GroupInfoByIdEntity> getGroupById(int id);
  Future<void> postAttendanceStudents();
  Future<void> getLastThreeLessonHistory();
  Future<void> getAllLessonHistory();
  Future<void> getAllHW();
  Future<void> deleteHWById();
  Future<void> createHWByStudentId();
  Future<void> getAllHWByStudentId();
  Future<void> deleteHWByStudentId();
  Future<void> postGradeByStudentsId();
}
