import 'package:equatable/equatable.dart';

class PointEntity extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final DateTime? date;

  const PointEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
