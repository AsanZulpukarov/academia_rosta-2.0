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
}
