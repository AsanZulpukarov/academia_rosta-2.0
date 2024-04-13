import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_statistic_event.dart';
part 'my_statistic_state.dart';

class MyStatisticBloc extends Bloc<MyStatisticEvent, MyStatisticState> {
  MyStatisticBloc() : super(MyStatisticInitialState()) {
    on<MyStatisticEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
