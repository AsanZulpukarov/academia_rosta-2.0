part of 'lesson_history_bloc.dart';

abstract class LessonHistoryState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LessonHistoryInitialState extends LessonHistoryState {}

class LessonHistoryLoadingState extends LessonHistoryState {}

class LessonHistoryLoadedState extends LessonHistoryState {
  final List<LessonEntity> lessons;

  LessonHistoryLoadedState({required this.lessons});
}

class LessonHistoryErrorState extends LessonHistoryState {
  final String message;

  LessonHistoryErrorState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
