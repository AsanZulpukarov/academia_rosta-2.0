import 'package:academia_rosta_diplom/features/home/domain/entities/group/hw_entity.dart';

class HWModel extends HWEntity {
  const HWModel({
    required super.id,
    required super.createDate,
    required super.deadline,
    required super.exercisesCount,
  });

  factory HWModel.fromJson(Map<String, dynamic> json) {
    return HWModel(
      id: json['id'],
      createDate: DateTime.fromMillisecondsSinceEpoch(json['createDate']),
      deadline: DateTime.fromMillisecondsSinceEpoch(json['deadline']),
      exercisesCount: json['exercisesCount'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createDate'] = createDate;
    data['deadline'] = deadline;
    data['exercisesCount'] = exercisesCount;
    return data;
  }
}
