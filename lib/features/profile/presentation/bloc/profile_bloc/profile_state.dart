part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
  @override
  List<Object> get props => [];
}

final class ProfileInitialState extends ProfileState {}

final class ProfileLoadingState extends ProfileState {}

final class ProfileLoadedState extends ProfileState {
  UserEntity user;
  ProfileLoadedState(this.user);

  @override
  // TODO: implement props
  List<Object> get props => [user];
}

final class ProfileErrorState extends ProfileState {
  String message;
  ProfileErrorState(this.message);
  @override
  // TODO: implement props
  List<Object> get props => [message];
}
