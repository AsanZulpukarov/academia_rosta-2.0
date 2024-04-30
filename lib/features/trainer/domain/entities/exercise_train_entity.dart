import 'package:equatable/equatable.dart';

class ExerciseTrainEntity extends Equatable {
  int? id;
  String? topic;
  int? questionCount;
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
