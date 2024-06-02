part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class ProfileEmptyEvent extends ProfileEvent {}

final class ProfileExitAccountEvent extends ProfileEvent {}
