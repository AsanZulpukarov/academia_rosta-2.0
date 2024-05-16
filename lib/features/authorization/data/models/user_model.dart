import 'package:academia_rosta_diplom/features/authorization/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required String token, required String role,required String imageName,})
      : super(token: token, role: role,imageName: imageName,);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json["token"]!,
      role: json["role"]!,
        imageName:json['imageName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "token": token!,
      "role": roleType?.toJson(roleType!) ?? "student",
    };
  }
}
