part of "sign_in_bloc.dart";

abstract class SignInState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignInInitialState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInLoadedState extends SignInState {}

class SignInErrorState extends SignInState {
  final String message;

  SignInErrorState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
