part of 'reset_password_bloc.dart';

abstract class ResetPasswordEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ResetPasswordButtonTapEvent extends ResetPasswordEvent {
  String username;

  ResetPasswordButtonTapEvent({required this.username});

  @override
  // TODO: implement props
  List<Object?> get props => [username];
}
