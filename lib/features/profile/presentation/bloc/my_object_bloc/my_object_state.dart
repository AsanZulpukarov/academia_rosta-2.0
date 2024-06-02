part of 'my_object_bloc.dart';

sealed class MySubjectState extends Equatable {
  const MySubjectState();

  @override
  List<Object> get props => [];
}

final class MySubjectInitialState extends MySubjectState {}

final class MySubjectLoadingState extends MySubjectState {}

final class MySubjectLoadedState extends MySubjectState {
  final List<SubjectEntity> objects;

  const MySubjectLoadedState({required this.objects});

  @override
  // TODO: implement props
  List<Object> get props => [objects];
}

final class MySubjectErrorState extends MySubjectState {
  final String message;

  const MySubjectErrorState({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
