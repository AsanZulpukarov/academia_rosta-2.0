part of 'my_statistic_bloc.dart';

sealed class MyStatisticState extends Equatable {
  const MyStatisticState();

  @override
  List<Object> get props => [];
}

final class MyStatisticInitialState extends MyStatisticState {}

final class MyStatisticLoadingState extends MyStatisticState {}

final class MyStatisticLoadedState extends MyStatisticState {
  final Map<String, MarkEntity> statistics;

  const MyStatisticLoadedState(this.statistics);

  @override
  // TODO: implement props
  List<Object> get props => [statistics];
}

final class MyStatisticErrorState extends MyStatisticState {
  final String message;

  const MyStatisticErrorState({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
