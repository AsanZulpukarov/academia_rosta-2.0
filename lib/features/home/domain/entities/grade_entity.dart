import 'package:academia_rosta_diplom/features/home/presentation/pages/home/group_page/grade/grade_screen.dart';
import 'package:equatable/equatable.dart';

class GradeEntity extends Equatable {
  final int idSubject;
  final int idStudent;
  final double rating;
  final GradeType gradeType;
  final String comment;

  const GradeEntity({
    required this.idSubject,
    required this.idStudent,
    required this.rating,
    required this.gradeType,
    required this.comment,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        idSubject,
        idStudent,
        rating,
        gradeType,
        comment,
      ];
}
