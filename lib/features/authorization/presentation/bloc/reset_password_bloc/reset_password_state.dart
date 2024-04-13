part of 'reset_password_bloc.dart';

abstract class ResetPasswordState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ResetPasswordInitialState extends ResetPasswordState {}

class ResetPasswordLoadingState extends ResetPasswordState {}

class ResetPasswordLoadedState extends ResetPasswordState {}

class ResetPasswordErrorState extends ResetPasswordState {
  String message;

  ResetPasswordErrorState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
