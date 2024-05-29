import 'package:equatable/equatable.dart';

class ExerciseEntity extends Equatable {
  final int? id;
  final String? topic;
  final int? questionCount;
  final int? digitsCount;
  final int? numbersCount;
  final double? speed;
  final String? type;
  final int? solved;
  final int? correct;
  final int? incorrect;

  const ExerciseEntity({
    required this.id,
    required this.topic,
    required this.questionCount,
    required this.digitsCount,
    required this.numbersCount,
    required this.speed,
    required this.type,
    required this.solved,
    required this.correct,
    required this.incorrect,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
