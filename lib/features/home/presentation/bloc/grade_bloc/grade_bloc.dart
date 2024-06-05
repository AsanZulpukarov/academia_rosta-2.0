import 'package:academia_rosta_diplom/features/home/domain/entities/group/student_entity.dart';
import 'package:academia_rosta_diplom/features/home/presentation/pages/home/group_page/grade_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'grade_event.dart';

part 'grade_state.dart';

class GradeBloc extends Bloc<GradeEvent, GradeState> {
  GradeBloc() : super(const GradeInitialState(),) {
    on<GradeAddStudentEvent>((event, emit) {
      emit(GradeLoadedStudentsState(students: event.studentEntity,));
    });
  }
}
