import 'package:academia_rosta_diplom/features/home/domain/entities/group/group_info_entity.dart';

class GroupInfoModel extends GroupInfoEntity {
  const GroupInfoModel({
    required id,
    required name,
    required teacher,
    required subject,
    required String image,
  }) : super(
          id: id,
          name: name,
          teacher: teacher,
          subject: subject,
          image: image,
        );

  factory GroupInfoModel.fromJson(Map<String, dynamic> json) {
    return GroupInfoModel(
      id: json['id'],
      name: json['name'],
      teacher: json['teacher'],
      subject: json['subject'],
      image: json['photo'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['teacher'] = teacher;
    data['subject'] = subject;
    data['photo'] = image;
    return data;
  }
}
