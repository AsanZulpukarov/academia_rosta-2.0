part of 'grade_bloc.dart';

sealed class GradeEvent extends Equatable {
  const GradeEvent();

  @override
  List<Object> get props => [];
}

final class GradeAddStudentEvent extends GradeEvent {
  final List<StudentEntity> studentEntity;

  const GradeAddStudentEvent({required this.studentEntity});
}
