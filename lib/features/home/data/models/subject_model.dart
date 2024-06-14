import 'package:academia_rosta_diplom/features/home/domain/entities/group/subject_entity.dart';

class SubjectModel extends SubjectEntity {
  const SubjectModel({
    required int id,
    required String name,
    required int cost,
    required bool isMental,
  }) : super(
          id: id,
          name: name,
          cost: cost,
    isMental: isMental,
        );

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      id: json['id'],
      name: json['name'],
      cost: json['cost'],
      isMental: json['isMental'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['cost'] = cost;
    data['isMental'] = isMental;
    return data;
  }
}
