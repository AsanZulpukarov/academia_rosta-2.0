import 'package:academia_rosta_diplom/features/home/domain/entities/grade_entity.dart';
import 'package:academia_rosta_diplom/features/home/presentation/pages/home/group_page/grade/grade_screen.dart';

class GradeModel extends GradeEntity {
  const GradeModel({
    required super.idSubject,
    required super.idStudent,
    required super.rating,
    required super.gradeType,
    required super.comment,
  });

  Map<String, dynamic> toJson() {
    return {
      'subjectId': idSubject,
      'pupilId': idStudent,
      'earnedPoints': rating.toInt(),
      'markType': _gradeTypeToString(gradeType),
      'topic': comment,
    };
  }

  static int _gradeTypeToString(GradeType gradeType) {
    switch (gradeType) {
      case GradeType.homeWork:
        return 0;
      case GradeType.classWork:
        return 1;
      case GradeType.selfWork:
        return 2;
    }
  }
}
