part of 'character_inc_dec_bloc.dart';

sealed class CharacterIncDecState extends Equatable {
  const CharacterIncDecState();
}

final class CharacterIncDecInitial extends CharacterIncDecState {
  @override
  List<Object> get props => [];
}
