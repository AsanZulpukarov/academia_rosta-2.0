part of 'lesson_history_bloc.dart';

abstract class LessonHistoryEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LessonHistoryEmptyEvent extends LessonHistoryEvent {
  final int id;

  LessonHistoryEmptyEvent({required this.id});
}
