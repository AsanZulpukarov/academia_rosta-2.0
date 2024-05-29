part of 'exercise_bloc.dart';

sealed class ExerciseState extends Equatable {
  const ExerciseState();

  @override
  List<Object> get props => [];
}

final class ExerciseInitialState extends ExerciseState {}

final class ExerciseLoadingState extends ExerciseState {}

final class ExerciseLoadedState extends ExerciseState {
  final List<ExerciseEntity> exercise;

  const ExerciseLoadedState({required this.exercise});
}

final class ExerciseErrorState extends ExerciseState {
  final String message;

  const ExerciseErrorState({required this.message});

}
