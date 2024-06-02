part of 'contact_bloc.dart';

sealed class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object> get props => [];
}

final class ContactInitialState extends ContactState {}

final class ContactLoadingState extends ContactState {}

final class ContactLoadedState extends ContactState {}

final class ContactErrorState extends ContactState {}
