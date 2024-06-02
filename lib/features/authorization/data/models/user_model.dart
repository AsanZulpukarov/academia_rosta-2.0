import 'package:academia_rosta_diplom/features/authorization/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required String token, required String role})
      : super(token: token, role: role);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json["token"] ?? "",
      role: json["role"] ?? "student",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "token": token!,
    };
  }
}
