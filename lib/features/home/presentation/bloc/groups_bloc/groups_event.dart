part of 'groups_bloc.dart';

abstract class GroupsEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GroupsEmptyEvent extends GroupsEvent {}
class GetGroupsStudentIdEvent extends GroupsEvent {
  final int id;

  GetGroupsStudentIdEvent({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
