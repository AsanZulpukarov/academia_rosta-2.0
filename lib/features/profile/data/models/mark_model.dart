import 'package:academia_rosta_diplom/features/profile/domain/entities/mark_entity.dart';

class MarkModel extends MarkEntity{
  const MarkModel({required super.topic, required super.correct, required super.incorrect, required super.total});
  factory MarkModel.fromJson(Map<String, dynamic> json) {
    return MarkModel(
      topic: json['topic'],
      correct: json['correct'],
      incorrect: json['incorrect'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'topic': topic,
      'correct': correct,
      'incorrect': incorrect,
      'total': total,
    };
  }
}