import 'package:academia_rosta_diplom/features/home/domain/entities/group/student_entity.dart';

class StudentModel extends StudentEntity {
  StudentModel({
    required id,
    required firstname,
    required lastname,
    required phoneNumber,
    super.isAttended,
  }) : super(
          id: id,
          firstname: firstname,
          lastname: lastname,
          phoneNumber: phoneNumber,
        );

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      phoneNumber: json['phoneNumber'],
      isAttended: json['isAttended'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['phoneNumber'] = phoneNumber;
    data['isAttended'] = isAttended;
    return data;
  }
}
