import 'package:academia_rosta_diplom/features/home/data/models/student_model.dart';
import 'package:academia_rosta_diplom/features/home/data/models/subject_model.dart';
import 'package:academia_rosta_diplom/features/home/data/models/teacher_model.dart';
import 'package:academia_rosta_diplom/features/home/data/models/timetable_model.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/group_info_by_id_entity.dart';

class GroupInfoByIdModel extends GroupInfoByIdEntity {
  const GroupInfoByIdModel({
    required id,
    required name,
    required teacher,
    required subject,
    required pupils,
    required timetable,
  }) : super(
          id: id,
          name: name,
          teacher: teacher,
          subject: subject,
          pupils: pupils,
          timetable: timetable,
        );

  factory GroupInfoByIdModel.fromJson(Map<String, dynamic> json) {
    return GroupInfoByIdModel(
      id: json['id'],
      name: json['name'],
      teacher: json['teacher'] != null
          ? TeacherModel.fromJson(json['teacher'])
          : null,
      subject: json['subject'] != null
          ? SubjectModel.fromJson(json['subject'])
          : null,
      pupils: json['pupils'] != null
          ? (json['pupils'] as List<dynamic>)
              .map((e) => StudentModel.fromJson(e))
              .toList()
          : null,
      timetable: json['timetable'] != null
          ? TimetableModel.fromJson(json['timetable'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (teacher != null) {
      data['teacher'] = teacher;
    }
    if (subject != null) {
      data['subject'] = subject;
    }
    if (pupils != null) {
      data['pupils'] = pupils!.map((v) => v).toList();
    }
    if (timetable != null) {
      data['timetable'] = timetable!;
    }
    return data;
  }
}
