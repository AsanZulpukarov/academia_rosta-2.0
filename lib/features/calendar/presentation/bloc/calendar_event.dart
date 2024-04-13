part of 'calendar_bloc.dart';

sealed class CalendarEvent extends Equatable {
  const CalendarEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CalendarEmptyEvent extends Equatable{
  DateTime dateTime;

  CalendarEmptyEvent(this.dateTime);
  @override
  // TODO: implement props
  List<Object?> get props => [dateTime];
}
