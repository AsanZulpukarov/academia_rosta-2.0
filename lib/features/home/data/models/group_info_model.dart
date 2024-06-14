import 'package:academia_rosta_diplom/features/home/domain/entities/group/group_info_entity.dart';

class GroupInfoModel extends GroupInfoEntity {
  const GroupInfoModel(
      {required int id,
      required String name,
      required String teacher,
      required String subject,
      required String image,
      required int subjectId,
      required bool isMentalGroups})
      : super(
          id: id,
          name: name,
          teacher: teacher,
          subject: subject,
          image: image,
          subjectId: subjectId,
          isMentalGroup: isMentalGroups,
        );

  factory GroupInfoModel.fromJson(Map<String, dynamic> json) {
    return GroupInfoModel(
      id: json['id'],
      name: json['name'],
      teacher: json['teacher'],
      subject: json['subject'],
      image: json['photo'],
      subjectId: json['subjectId'],
      isMentalGroups: json['isMental'],
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
