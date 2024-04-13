import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'grade_event.dart';
part 'grade_state.dart';

class GradeBloc extends Bloc<GradeEvent, GradeState> {
  GradeBloc() : super(GradeInitialState()) {
    on<GradeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
