part of 'contact_bloc.dart';

sealed class ContactEvent extends Equatable {
  const ContactEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class ContactEmptyEvent extends ContactEvent {}
