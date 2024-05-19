import 'package:equatable/equatable.dart';

class ExerciseTrainEntity extends Equatable {
  final int? id;
  String? topic;
  final int? questionCount;
  int? digitsCount;
  int? numberCount;
  double? speed;

  ExerciseTrainEntity({
    this.id,
    this.topic,
    this.questionCount,
    this.digitsCount,
    this.numberCount,
    this.speed,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        topic,
        questionCount,
        digitsCount,
        numberCount,
        speed,
      ];
}
