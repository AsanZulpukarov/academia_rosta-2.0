import 'package:equatable/equatable.dart';

class StudentEntity extends Equatable {
  final int? id;
  final String? firstname;
  final String? lastname;
  final String? phoneNumber;
  bool? isAttended;

  StudentEntity({
    this.id,
    this.firstname,
    this.lastname,
    this.phoneNumber,
    this.isAttended = false,
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
        isAttended,
      ];
}
