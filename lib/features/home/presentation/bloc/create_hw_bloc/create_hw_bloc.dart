import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_hw_event.dart';
part 'create_hw_state.dart';

class CreateHwBloc extends Bloc<CreateHwEvent, CreateHwState> {
  CreateHwBloc() : super(CreateHwInitialState()) {
    on<CreateHwEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
