part of 'grade_bloc.dart';

sealed class GradeState extends Equatable {
  const GradeState();

  @override
  List<Object> get props => [];
}

final class GradeInitialState extends GradeState {}

final class GradeLoading extends GradeState {}

final class GradeLoadedState extends GradeState {}

final class GradeTypeSelectState extends GradeState {}

final class GradeEditStarState extends GradeState {}
