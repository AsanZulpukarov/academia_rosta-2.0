import 'package:academia_rosta_diplom/features/home/domain/entities/group/teacher_entity.dart';

class TeacherModel extends TeacherEntity {
  const TeacherModel(
      {required id,
      required firstname,
      required lastname,
      required phoneNumber})
      : super(
          id: id,
          firstname: firstname,
          lastname: lastname,
          phoneNumber: phoneNumber,
        );

  factory TeacherModel.fromJson(Map<String, dynamic> json) {
    return TeacherModel(
      id: json['id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}
