part of 'trainer_bloc.dart';

sealed class TrainerState extends Equatable {
  final ExerciseTrainEntity exerciseTrainEntity;

  const TrainerState({required this.exerciseTrainEntity});

  @override
  List<Object> get props => [];
}

class TrainerInitialState extends TrainerState {
  const TrainerInitialState({required super.exerciseTrainEntity});
}

class TrainerLoadingState extends TrainerState {
  const TrainerLoadingState({required super.exerciseTrainEntity});
}

class TrainerLoadedState extends TrainerState {
  final List<int> numbers;

  const TrainerLoadedState(
      {required this.numbers, required super.exerciseTrainEntity});

  @override
  // TODO: implement props
  List<Object> get props => [numbers];
}

class TrainerErrorState extends TrainerState {
  final String message;

  const TrainerErrorState(
      {required this.message, required super.exerciseTrainEntity});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
