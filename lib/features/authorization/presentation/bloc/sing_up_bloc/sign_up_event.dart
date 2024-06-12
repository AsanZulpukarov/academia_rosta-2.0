part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SingUpButtonEvent extends SignUpEvent {
  final SignUpEntity signUpEntity;

  SingUpButtonEvent({required this.signUpEntity});

  @override
  // TODO: implement props
  List<Object?> get props => [signUpEntity];
}
