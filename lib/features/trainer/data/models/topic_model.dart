import 'package:academia_rosta_diplom/features/trainer/domain/entities/topic_entity.dart';

class TopicModel extends TopicEntity{

  const TopicModel({required super.name,required super.code,});

  factory TopicModel.fromJson(Map<String, dynamic> json) {
    return TopicModel(
      name: json['name'] as String,
      code: json['code'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
    };
  }
}