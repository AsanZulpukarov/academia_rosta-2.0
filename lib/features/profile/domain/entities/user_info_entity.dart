import 'package:equatable/equatable.dart';

class UserInfoEntity extends Equatable {
  int? id;
  String? firstname;
  String? lastname;
  String? email;
  String? username;
  String? phoneNumber;

  UserInfoEntity({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.username,
    required this.phoneNumber,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        firstname,
        lastname,
        email,
        username,
        phoneNumber,
      ];
}
