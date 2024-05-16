part of 'reset_password_code_bloc.dart';

abstract class ResetPasswordCodeState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ResetPasswordCodeInitialState extends ResetPasswordCodeState {}

class ResetPasswordCodeLoadingState extends ResetPasswordCodeState {}

class ResetPasswordCodeLoadedState extends ResetPasswordCodeState {}

class ResetPasswordCodeErrorState extends ResetPasswordCodeState {
  final String message;

  ResetPasswordCodeErrorState({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
