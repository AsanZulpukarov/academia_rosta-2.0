import 'package:equatable/equatable.dart';

class StudentEntity extends Equatable {
  int? id;
  String? firstname;
  String? lastname;
  String? phoneNumber;

  StudentEntity({
    this.id,
    this.firstname,
    this.lastname,
    this.phoneNumber,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        firstname,
        lastname,
        phoneNumber,
      ];
}
