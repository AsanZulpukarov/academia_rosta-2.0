import 'package:equatable/equatable.dart';

class CreateHWEntity extends Equatable {
  final int? pupilId;
  final int? groupId;
  final DateTime? deadline;

  const CreateHWEntity({
    required this.pupilId,
    required this.groupId,
    required this.deadline,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        pupilId,
        groupId,
        deadline,
      ];
}
