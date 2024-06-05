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

final class GradeLoadedStudentsState extends GradeState {
  final List<StudentEntity> students;
  const GradeLoadedStudentsState({required this.students,});
  @override
  // TODO: implement props
  List<Object> get props => [students];
}
