import 'package:equatable/equatable.dart';

class SubjectEntity extends Equatable {
  final int? id;
  final String? name;
  final int? cost;

  const SubjectEntity({
    this.id,
    this.name,
    this.cost,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        cost,
      ];
}
