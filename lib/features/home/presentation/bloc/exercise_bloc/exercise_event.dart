part of 'exercise_bloc.dart';

final class ExerciseEvent extends Equatable {
  const ExerciseEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class ExerciseGetEvent extends ExerciseEvent {
  final int id;

  const ExerciseGetEvent({required this.id});
}
