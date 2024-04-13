part of 'edit_profile_bloc.dart';

sealed class EditProfileEvent extends Equatable {
  const EditProfileEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class EditProfileEmptyEvent extends EditProfileEvent {
  UserEntity user;
  EditProfileEmptyEvent(this.user);
}

final class EditProfileChangeImageEvent extends EditProfileEvent {}

final class EditProfileSaveEvent extends EditProfileEvent {}
