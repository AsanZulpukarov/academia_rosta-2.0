import 'package:academia_rosta_diplom/features/home/domain/entities/group/subject_entity.dart';

class SubjectModel extends SubjectEntity {
  SubjectModel({
    required id,
    required name,
    required cost,
  }) : super(
          id: id,
          name: name,
          cost: cost,
        );

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      id: json['id'],
      name: json['name'],
      cost: json['cost'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['cost'] = cost;
    return data;
  }
}
