part of 'grade_bloc.dart';

sealed class GradeState extends Equatable {
  const GradeState();

  @override
  List<Object> get props => [];
}

final class GradeInitialState extends GradeState {
  const GradeInitialState();
}

final class GradeLoadingState extends GradeState {
  const GradeLoadingState();
}

final class GradeLoadedState extends GradeState {
  const GradeLoadedState();
}

final class GradeErrorState extends GradeState {
  final String message;
  const GradeErrorState({required this.message});
  @override
  // TODO: implement props
  List<Object> get props => [message];
}
