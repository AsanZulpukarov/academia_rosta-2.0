part of 'lesson_history_bloc.dart';

abstract class LessonHistoryState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LessonHistoryInitialState extends LessonHistoryState {}

class LessonHistoryLoadingState extends LessonHistoryState {}

class LessonHistoryLoadedState extends LessonHistoryState {}

class LessonHistoryErrorState extends LessonHistoryState {
  String message;

  LessonHistoryErrorState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
