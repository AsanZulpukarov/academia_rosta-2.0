part of 'edit_profile_bloc.dart';

sealed class EditProfileState extends Equatable {
  const EditProfileState();

  @override
  List<Object> get props => [];
}

final class EditProfileInitialState extends EditProfileState {}

final class EditProfileLoadingState extends EditProfileState {}

final class EditProfileLoadedState extends EditProfileState {}

final class EditProfileErrorState extends EditProfileState {}
