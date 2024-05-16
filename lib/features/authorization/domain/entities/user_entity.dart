import 'package:academia_rosta_diplom/features/authorization/domain/enums/role_enum.dart';

class UserEntity {
  final String? token;
  RoleType? roleType;
  String? imageName;

  UserEntity({required this.token, required String role,required this.imageName}) {
    roleType = roleType?.fromJson(role);
  }
}
