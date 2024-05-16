import 'package:equatable/equatable.dart';

class TeacherEntity extends Equatable {
  final int? id;
  final String? firstname;
  final String? lastname;
  final String? phoneNumber;

  const TeacherEntity({
    this.id,
    this.firstname,
    this.lastname,
    this.phoneNumber,
  });

  String getFullName(){
    return "$lastname $firstname";
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        firstname,
        lastname,
        phoneNumber,
      ];
}
