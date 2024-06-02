part of 'calendar_bloc.dart';

sealed class CalendarState extends Equatable {
  const CalendarState();

  @override
  List<Object> get props => [];
}

final class CalendarInitialState extends CalendarState {}

final class CalendarLoadingState extends CalendarState {}

final class CalendarLoadedState extends CalendarState {}

final class CalendarErrorState extends CalendarState {}
