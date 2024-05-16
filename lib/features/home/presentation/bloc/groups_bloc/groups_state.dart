part of 'groups_bloc.dart';

abstract class GroupsState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GroupsInitialState extends GroupsState {}

class GroupsLoadingState extends GroupsState {}

class GroupsLoadedState extends GroupsState {
  final List<GroupInfoEntity> groups;

  GroupsLoadedState(this.groups);

  @override
  // TODO: implement props
  List<Object?> get props => [groups];
}

class GroupsErrorState extends GroupsState {
  final String message;

  GroupsErrorState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
