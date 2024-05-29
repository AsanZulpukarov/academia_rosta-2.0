import 'package:equatable/equatable.dart';

class HWEntity extends Equatable {
  final int? id;
  final DateTime? createDate;
  final DateTime? deadline;
  final int? exercisesCount;

  const HWEntity({
    required this.id,
    required this.createDate,
    required this.deadline,
    required this.exercisesCount,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
