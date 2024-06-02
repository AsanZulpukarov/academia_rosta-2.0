part of 'edit_profile_bloc.dart';

sealed class EditProfileState extends Equatable {
  const EditProfileState();

  @override
  List<Object> get props => [];
}

final class EditProfileInitialState extends EditProfileState {}

final class EditProfileLoadingState extends EditProfileState {}

final class EditProfileSavedState extends EditProfileState {}

final class EditProfileLoadedState extends EditProfileState {
  final UserInfoEntity userInfoEntity;

  const EditProfileLoadedState({required this.userInfoEntity});
}

final class EditProfileImageLoadedState extends EditProfileState {}

final class EditProfileErrorState extends EditProfileState {
  final String message;

  const EditProfileErrorState({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
