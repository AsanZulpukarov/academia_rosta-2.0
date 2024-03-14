import 'package:academia_rosta_diplom/features/authorization/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required int id, required String token, required String role})
      : super(id: id, token: token, role: role);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: int.parse(json["id"]),
      token: json["token"]!,
      role: json["role"]!,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "token": token!,
      "role": roleType?.toJson(roleType!) ?? "student",
    };
  }
}
