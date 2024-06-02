part of 'my_object_bloc.dart';

sealed class MySubjectEvent extends Equatable {
  const MySubjectEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class MySubjectEmptyEvent extends MySubjectEvent {}
