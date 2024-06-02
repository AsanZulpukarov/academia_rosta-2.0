part of 'grade_bloc.dart';

sealed class GradeEvent extends Equatable {
  const GradeEvent();

  @override
  List<Object> get props => [];
}

final class GradeAddStudentEvent extends GradeEvent {}

final class GradeEditStarEvent extends GradeEvent {}

final class GradeSelectType extends GradeEvent {}
