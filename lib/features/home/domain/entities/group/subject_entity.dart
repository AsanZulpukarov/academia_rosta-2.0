import 'package:equatable/equatable.dart';

class SubjectEntity extends Equatable {
  final int? id;
  final String? name;
  final int? cost;
  final bool? isMental;

  const SubjectEntity({
    this.id,
    this.name,
    this.cost,
    this.isMental,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        cost,
      ];
}
