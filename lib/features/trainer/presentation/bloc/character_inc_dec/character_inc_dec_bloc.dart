import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'character_inc_dec_event.dart';
part 'character_inc_dec_state.dart';

class CharacterIncDecBloc
    extends Bloc<CharacterIncDecEvent, CharacterIncDecState> {
  CharacterIncDecBloc() : super(CharacterIncDecInitial()) {
    on<CharacterIncDecEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
