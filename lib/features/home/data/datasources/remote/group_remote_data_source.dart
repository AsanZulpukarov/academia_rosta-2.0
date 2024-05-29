import 'package:academia_rosta_diplom/features/home/data/models/group_info_by_id_model.dart';
import 'package:academia_rosta_diplom/features/home/data/models/group_info_model.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/exercise_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/group_info_by_id_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/group_info_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/hw_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/lesson_entity.dart';

abstract class GroupRemoteDataSource {
  Future<List<GroupInfoEntity>> getAllGroups();
  Future<GroupInfoByIdEntity> getGroupById(int id);
  Future<void> postAttendanceStudents();
  Future<void> getLastThreeLessonHistory();
  Future<List<LessonEntity>> getAllLessonHistory(int id);
  Future<List<ExerciseEntity>> getExerciseByHWId(int id);
  Future<void> deleteHWById();
  Future<void> createHWByStudentId();
  Future<List<HWEntity>> getAllHWByStudentId({required int idSubject,required int idStudent});
  Future<void> deleteHWByStudentId();
  Future<void> postGradeByStudentsId();
}
