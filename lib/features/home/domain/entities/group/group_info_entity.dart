import 'package:equatable/equatable.dart';

class GroupInfoEntity extends Equatable {
  final int? id;
  final String? name;
  final String? teacher;
  final String? subject;

  const GroupInfoEntity({
    this.id,
    this.name,
    this.teacher,
    this.subject,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        teacher,
        subject,
      ];
}
