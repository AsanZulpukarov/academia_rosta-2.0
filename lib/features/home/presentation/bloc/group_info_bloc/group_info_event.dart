part of 'group_info_bloc.dart';

abstract class GroupInfoEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GroupInfoEmptyEvent extends GroupInfoEvent {
  final int id;

  GroupInfoEmptyEvent(this.id);
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
