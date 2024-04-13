part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SingInButtonEvent extends SignUpEvent {
  SignUpEntity signUpEntity;

  SingInButtonEvent({required this.signUpEntity});

  @override
  // TODO: implement props
  List<Object?> get props => [signUpEntity];
}
