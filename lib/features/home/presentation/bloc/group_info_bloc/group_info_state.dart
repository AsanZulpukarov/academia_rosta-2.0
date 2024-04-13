part of 'group_info_bloc.dart';

abstract class GroupInfoState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GroupInfoInitialState extends GroupInfoState {}

class GroupInfoLoadingState extends GroupInfoState {}

class GroupInfoLoadedState extends GroupInfoState {
  List<GroupInfoModel> groups;

  GroupInfoLoadedState(this.groups);

  @override
  // TODO: implement props
  List<Object?> get props => [groups];
}

class GroupInfoErrorState extends GroupInfoState {
  String message;

  GroupInfoErrorState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
