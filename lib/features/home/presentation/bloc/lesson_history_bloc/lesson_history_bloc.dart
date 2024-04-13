import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'lesson_history_event.dart';
part 'lesson_history_state.dart';

class LastThreeLessonHistoryBloc
    extends Bloc<LessonHistoryEvent, LessonHistoryState> {
  LastThreeLessonHistoryBloc() : super(LessonHistoryInitialState()) {
    emit(LessonHistoryLoadingState());
  }
}
