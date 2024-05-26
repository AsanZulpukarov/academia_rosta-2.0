part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
  @override
  List<Object> get props => [];
}

final class ProfileInitialState extends ProfileState {}

final class ProfileLoadingState extends ProfileState {}

final class ProfileLoadedState extends ProfileState {
  final UserInfoEntity user;
  const ProfileLoadedState(this.user);

  @override
  // TODO: implement props
  List<Object> get props => [user];
}

final class ProfileErrorState extends ProfileState {
  final String message;
  const ProfileErrorState(this.message);
  @override
  // TODO: implement props
  List<Object> get props => [message];
}
