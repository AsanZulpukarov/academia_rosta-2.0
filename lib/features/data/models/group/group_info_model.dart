import 'package:academia_rosta_diplom/features/domain/entities/group/group_info_entity.dart';

class GroupInfoModel extends GroupInfoEntity {
  GroupInfoModel(
      {required id, required name, required teacher, required subject})
      : super(
          id: id,
          name: name,
          teacher: teacher,
          subject: subject,
        );
  factory GroupInfoModel.fromJson(Map<String, dynamic> json) {
    return GroupInfoModel(
      id: json['id'],
      name: json['name'],
      teacher: json['teacher'],
      subject: json['subject'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['teacher'] = teacher;
    data['subject'] = subject;
    return data;
  }
}
