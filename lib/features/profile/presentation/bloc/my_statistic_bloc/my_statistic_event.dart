part of 'my_statistic_bloc.dart';

sealed class MyStatisticEvent extends Equatable {
  const MyStatisticEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class MyStatisticEmptyEvent extends MyStatisticEvent{}
