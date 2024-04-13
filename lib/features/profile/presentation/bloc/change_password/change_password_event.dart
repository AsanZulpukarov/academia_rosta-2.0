part of 'change_password_bloc.dart';

sealed class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class ResetPasswordSaveEvent extends ChangePasswordEvent {}
