import 'package:equatable/equatable.dart';

class StudentEntity extends Equatable {
  final int? id;
  final String? firstname;
  final String? lastname;
  final String? phoneNumber;
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
