part of 'edit_profile_bloc.dart';

sealed class EditProfileEvent extends Equatable {
  const EditProfileEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class EditProfileEmptyEvent extends EditProfileEvent {
  const EditProfileEmptyEvent();
}

final class EditProfileChangeImageEvent extends EditProfileEvent {
  final int avatar;

  const EditProfileChangeImageEvent(this.avatar);
}

final class EditProfileSaveEvent extends EditProfileEvent {
  final UserInfoEntity userInfoEntity;

  const EditProfileSaveEvent(this.userInfoEntity);
  @override
  // TODO: implement props
  List<Object?> get props => [userInfoEntity];

}
