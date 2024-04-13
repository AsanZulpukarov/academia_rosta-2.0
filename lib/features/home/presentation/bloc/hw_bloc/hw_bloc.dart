import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'hw_event.dart';
part 'hw_state.dart';

class HwBloc extends Bloc<HWEvent, HWState> {
  HwBloc() : super(HWInitialState()) {
    on<HWEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
