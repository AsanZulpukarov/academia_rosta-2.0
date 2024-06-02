import 'package:academia_rosta_diplom/features/home/domain/entities/group/exercise_entity.dart';

class ExerciseModel extends ExerciseEntity {
  const ExerciseModel({
    required super.id,
    required super.topic,
    required super.questionCount,
    required super.digitsCount,
    required super.numbersCount,
    required super.speed,
    required super.type,
    required super.solved,
    required super.correct,
    required super.incorrect,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      id: json['id'],
      topic: json['topic'],
      questionCount: json['questionCount'],
      digitsCount: json['digitsCount'],
      numbersCount: json['numbersCount'],
      speed: json['speed'],
      type: json['type'],
      solved: json['solved'],
      correct: json['correct'],
      incorrect: json['incorrect'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['topic'] = topic;
    data['questionCount'] = questionCount;
    data['digitsCount'] = digitsCount;
    data['numbersCount'] = numbersCount;
    data['speed'] = speed;
    data['type'] = type;
    data['solved'] = solved;
    data['correct'] = correct;
    data['incorrect'] = incorrect;
    return data;
  }
}
