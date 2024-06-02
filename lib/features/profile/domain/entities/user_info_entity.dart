import 'package:equatable/equatable.dart';

class UserInfoEntity extends Equatable {
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? username;
  final String? phoneNumber;

  const UserInfoEntity({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.username,
    required this.phoneNumber,
  });

  String getFIO() {
    return "$lastname $firstname";
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        firstname,
        lastname,
        email,
        username,
        phoneNumber,
      ];
}
