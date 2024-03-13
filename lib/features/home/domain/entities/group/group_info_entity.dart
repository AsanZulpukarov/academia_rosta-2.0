import 'package:equatable/equatable.dart';

class GroupInfoEntity extends Equatable {
  int? id;
  String? name;
  String? teacher;
  String? subject;

  GroupInfoEntity({this.id, this.name, this.teacher, this.subject,});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        teacher,
        subject,
      ];
}
