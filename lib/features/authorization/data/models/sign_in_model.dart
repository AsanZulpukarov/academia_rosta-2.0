import 'package:academia_rosta_diplom/features/authorization/domain/entities/sign_in_entity.dart';

class SignInModel extends SignInEntity {
  SignInModel({
    required String? username,
    required String? password,
  }) : super(
          username: username,
          password: password,
        );

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      username: json["username"],
      password: json["password"],
    );
  }

  toJson() {
    return {
      "username": username,
      "password": password,
    };
  }
}
