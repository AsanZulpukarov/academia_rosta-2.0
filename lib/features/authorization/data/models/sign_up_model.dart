import 'package:academia_rosta_diplom/features/authorization/domain/entities/sign_up_entity.dart';
import 'package:intl/intl.dart';

class SignUpModel extends SignUpEntity {
  SignUpModel({
    required String? firstname,
    required String? lastname,
    required String? phone,
    required String? polPerson,
    required String? email,
    required DateTime? bDay,
    required String? username,
    required String? password,
    required String? confirmPassword,
    required String? branch,
  }) : super(
          firstname: firstname,
          lastname: lastname,
          phone: phone,
          polPerson: polPerson,
          email: email,
          bDay: bDay,
          username: username,
          password: password,
          confirmPassword: confirmPassword,
          branch: branch,
        );

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      firstname: json['firstname'],
      lastname: json["lastname"],
      phone: json["phone"],
      polPerson: json["sex"],
      email: json["email"],
      bDay: json["birthday"],
      username: json["username"],
      password: json["password"],
      confirmPassword: json["confirmPassword"],
      branch: json["branch"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "firstname": firstname,
      "lastname": lastname,
      "phone": phone,
      "sex": polPerson,
      "email": email,
      "birthday": DateFormat("dd.MM.yyyy").format(bDay!),
      "username": username,
      "password": password,
      "confirmPassword": confirmPassword,
      "branch": branch,
    };
  }
}
