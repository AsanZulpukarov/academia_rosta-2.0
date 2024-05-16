part of 'group_info_bloc.dart';

abstract class GroupInfoState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GroupInfoInitialState extends GroupInfoState {}

class GroupInfoLoadingState extends GroupInfoState {}

class GroupInfoLoadedState extends GroupInfoState {
  final GroupInfoByIdEntity group;

  GroupInfoLoadedState(this.group);

  @override
  // TODO: implement props
  List<Object?> get props => [group];
}

class GroupInfoErrorState extends GroupInfoState {
  final String message;

  GroupInfoErrorState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
