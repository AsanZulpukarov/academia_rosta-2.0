import 'package:equatable/equatable.dart';

class SubjectEntity extends Equatable {
  int? id;
  String? name;
  int? cost;

  SubjectEntity({
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
