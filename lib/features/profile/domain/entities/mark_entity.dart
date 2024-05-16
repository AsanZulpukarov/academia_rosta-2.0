import 'package:equatable/equatable.dart';

class MarkEntity extends Equatable{
  final String? topic;
  final int? correct;
  final int? incorrect;
  final int? total;

  const MarkEntity({required this.topic, required this.correct, required this.incorrect, required this.total});


  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}