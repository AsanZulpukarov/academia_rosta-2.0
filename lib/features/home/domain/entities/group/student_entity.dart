import 'package:equatable/equatable.dart';

class StudentEntity extends Equatable {
  final int? id;
  final String? firstname;
  final String? lastname;
  final String? phoneNumber;
  final String? email;
  final DateTime? birthday;
  bool? isAttended;

  StudentEntity({
    this.id,
    this.firstname,
    this.lastname,
    this.phoneNumber,
    this.birthday,
    this.email,
    this.isAttended = false,
  });

  String getFullName() {
    return "$lastname $firstname";
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        firstname,
        lastname,
        phoneNumber,
        isAttended,
      ];
}
