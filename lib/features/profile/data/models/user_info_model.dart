import 'package:academia_rosta_diplom/features/profile/domain/entities/user_info_entity.dart';

class UserInfoModel extends UserInfoEntity {
  const UserInfoModel({
    required String? firstname,
    required String? lastname,
    required String? email,
    required String? username,
    required String? phoneNumber,
  }) : super(
          firstname: firstname,
          lastname: lastname,
          email: email,
          username: username,
          phoneNumber: phoneNumber,
        );

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      username: json['username'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['email'] = email;
    data['username'] = username;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}
