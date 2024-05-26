part of "sign_in_bloc.dart";

abstract class SignInEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SingInButtonEvent extends SignInEvent {
  final SignInEntity signInEntity;

  SingInButtonEvent(this.signInEntity);

  @override
  // TODO: implement props
  List<Object?> get props => [signInEntity];
}
