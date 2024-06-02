import 'package:equatable/equatable.dart';

class TopicEntity extends Equatable {
  final String name;
  final String code;
  final String json;

  const TopicEntity({
    required this.name,
    required this.code,
    required this.json,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [name, code, json];
}
