import 'package:academia_rosta_diplom/features/authorization/domain/enums/role_enum.dart';

class UserEntity {
  final String? token;
  RoleType? roleType;
  int? avatar;

  UserEntity({
    required this.token,
    required this.roleType,
    this.avatar,
  });

  int getAvatar() {
    return avatar ?? 0;
  }

  void setAvatar(int index) {
    avatar = index;
  }
}
