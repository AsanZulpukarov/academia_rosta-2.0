part of 'reset_password_code_bloc.dart';

abstract class ResetPasswordCodeEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ResetPasswordButtonTapCodeEvent extends ResetPasswordCodeEvent {}
