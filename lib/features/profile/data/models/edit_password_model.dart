import 'package:academia_rosta_diplom/features/profile/domain/entities/edit_password_entity.dart';

class EditPasswordModel extends EditPasswordEntity {
  EditPasswordModel({
    required int id,
    required String password,
    required String confirmPassword,
  }) : super(
          id: id,
          password: password,
          confirmPassword: confirmPassword,
        );

  factory EditPasswordModel.fromJson(Map<String, dynamic> json) {
    return EditPasswordModel(
      id: int.parse(json["id"]),
      password: json["password"],
      confirmPassword: json["confirmPassword"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "password": password,
      "confirmPassword": confirmPassword,
    };
  }
}
