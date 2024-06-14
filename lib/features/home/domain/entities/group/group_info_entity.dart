import 'package:equatable/equatable.dart';

class GroupInfoEntity extends Equatable {
  final int? id;
  final String? name;
  final String? teacher;
  final String? subject;
  final int? subjectId;
  final bool? isMentalGroup;
  final String? image;

  const GroupInfoEntity({
    this.id,
    this.name,
    this.teacher,
    this.subject,
    this.image,
    this.subjectId,
    this.isMentalGroup,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        teacher,
        subject,
    image,
    subjectId,
    isMentalGroup,
      ];
}
