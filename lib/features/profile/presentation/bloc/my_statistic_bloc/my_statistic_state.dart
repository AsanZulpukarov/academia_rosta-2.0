part of 'my_statistic_bloc.dart';

sealed class MyStatisticState extends Equatable {
  const MyStatisticState();

  @override
  List<Object> get props => [];
}

final class MyStatisticInitialState extends MyStatisticState {}

final class MyStatisticLoadingState extends MyStatisticState {}

final class MyStatisticLoadedState extends MyStatisticState {}

final class MyStatisticErrorState extends MyStatisticState {}
