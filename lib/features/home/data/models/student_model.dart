import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/student_entity.dart';
import 'package:intl/intl.dart';

class StudentModel extends StudentEntity {
  StudentModel({
    required id,
    required firstname,
    required lastname,
    required phoneNumber,
    required email,
    required birthday,
    super.isAttended,
  }) : super(
          id: id,
          firstname: firstname,
          lastname: lastname,
          phoneNumber: phoneNumber,
          birthday: birthday,
    email: email,
        );

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      phoneNumber: json['phoneNumber'],
      birthday: DateTime.fromMillisecondsSinceEpoch(json['dateOfBirth'] ?? DateTime.now().millisecond),
      email: json['email'],
      isAttended: json['isAttended'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['phoneNumber'] = phoneNumber;
    data['dateOfBirth'] = DateFormat('yyyy-MM-dd').format(birthday ?? DateTime.now());
    data['email'] = email;
    data['isAttended'] = isAttended;
    return data;
  }
}
