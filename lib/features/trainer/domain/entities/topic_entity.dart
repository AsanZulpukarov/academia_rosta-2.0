import 'package:equatable/equatable.dart';

class TopicEntity extends Equatable{
  final String name;
  final String code;

  const TopicEntity({required this.name, required this.code});

  @override
  // TODO: implement props
  List<Object?> get props => [name,code,];
}