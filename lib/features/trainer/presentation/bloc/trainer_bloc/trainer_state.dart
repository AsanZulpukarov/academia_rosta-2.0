part of 'trainer_bloc.dart';

sealed class TrainerState extends Equatable {
  const TrainerState();

  @override
  List<Object> get props => [];
}

final class TrainerInitialState extends TrainerState {}
