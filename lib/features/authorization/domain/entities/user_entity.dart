import 'package:academia_rosta_diplom/features/authorization/domain/enums/role_enum.dart';

class UserEntity {
  int? id;
  String? token;
  RoleType? roleType;

  UserEntity({required this.id, required this.token, required String role}) {
    roleType = roleType?.fromJson(role);
  }
}
