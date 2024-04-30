part of 'change_password_bloc.dart';

sealed class ChangePasswordState extends Equatable {
  const ChangePasswordState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class ChangePasswordInitialsState extends ChangePasswordState {}

final class ChangePasswordLoadingState extends ChangePasswordState {}

final class ChangePasswordLoadedState extends ChangePasswordState {}

final class ChangePasswordErrorState extends ChangePasswordState {
  String message;
  ChangePasswordErrorState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
