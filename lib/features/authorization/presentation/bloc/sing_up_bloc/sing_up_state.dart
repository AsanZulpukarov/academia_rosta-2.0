part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpLoadedState extends SignUpState {}

class SignUpErrorState extends SignUpState {
  String message;

  SignUpErrorState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
