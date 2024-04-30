import 'package:academia_rosta_diplom/features/trainer/domain/entities/exercise_train_entity.dart';

class ExerciseTrainModel extends ExerciseTrainEntity {
  ExerciseTrainModel({
    required int id,
    required String topic,
    required int questionCount,
    required int digitsCount,
    required int numberCount,
    required double speed,
  }) : super(
          id: id,
          topic: topic,
          questionCount: questionCount,
          digitsCount: digitsCount,
          numberCount: numberCount,
          speed: speed,
        );

  factory ExerciseTrainModel.fromJson(Map<String, dynamic> json) {
    return ExerciseTrainModel(
      id: json['id'],
      topic: json['topic'],
      questionCount: json['questionCount'],
      digitsCount: json['digitsCount'],
      numberCount: json['numberCount'],
      speed: json['speed'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['topic'] = topic;
    data['questionCount'] = questionCount;
    data['digitsCount'] = digitsCount;
    data['numberCount'] = numberCount;
    data['speed'] = speed;
    return data;
  }
}
