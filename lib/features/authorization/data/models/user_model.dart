import 'package:academia_rosta_diplom/features/authorization/domain/entities/user_entity.dart';
import 'package:academia_rosta_diplom/features/authorization/domain/enums/role_enum.dart';

class UserModel extends UserEntity {
  UserModel({
    required String token,
    required RoleType role,
    required int avatar,
  }) : super(
          token: token,
          roleType: role,
          avatar: avatar,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json["token"] ?? "",
      role: RoleType.student.fromJson(json["role"]),
      avatar: json['avatar'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "token": token!,
    };
  }
}
