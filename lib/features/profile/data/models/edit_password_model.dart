import 'package:academia_rosta_diplom/features/profile/domain/entities/edit_password_entity.dart';

class EditPasswordModel extends EditPasswordEntity {
  EditPasswordModel({
    required String? password,
    required String? confirmPassword,
  }) : super(
          password: password,
          confirmPassword: confirmPassword,
        );

  factory EditPasswordModel.fromJson(Map<String, dynamic> json) {
    return EditPasswordModel(
      password: json["password"],
      confirmPassword: json["confirmPassword"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "password": password,
    };
  }
}
