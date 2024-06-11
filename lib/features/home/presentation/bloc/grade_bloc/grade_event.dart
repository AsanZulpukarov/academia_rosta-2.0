part of 'grade_bloc.dart';

sealed class GradeEvent extends Equatable {
  const GradeEvent();

  @override
  List<Object> get props => [];
}

final class GradeSaveEvent extends GradeEvent {
  final GradeEntity gradeEntity;

  const GradeSaveEvent({required this.gradeEntity});
}
