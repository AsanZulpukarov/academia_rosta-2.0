part of 'hw_bloc.dart';

sealed class HWEvent extends Equatable {
  const HWEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class HWEmptyEvent extends HWEvent {
  final int idSubject;
  final int idStudent;

  const HWEmptyEvent({required this.idSubject, required this.idStudent});

  @override
  // TODO: implement props
  List<Object?> get props => [
        idSubject,
        idStudent,
      ];
}

final class StudentHWGetEvent extends HWEvent {
  final int idSubject;

  const StudentHWGetEvent({required this.idSubject});

  @override
  // TODO: implement props
  List<Object?> get props => [idSubject];
}
