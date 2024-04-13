import 'package:equatable/equatable.dart';

class StudentEntity extends Equatable {
  int? id;
  String? firstname;
  String? lastname;
  String? phoneNumber;
  bool? isSelect;

  StudentEntity({
    this.id,
    this.firstname,
    this.lastname,
    this.phoneNumber,
    this.isSelect = false,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        firstname,
        lastname,
        phoneNumber,
        isSelect,
      ];
}
