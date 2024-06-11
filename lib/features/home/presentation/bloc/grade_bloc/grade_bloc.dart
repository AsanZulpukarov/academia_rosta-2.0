import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/grade_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/usecases/post_grade_by_students_id.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'grade_event.dart';

part 'grade_state.dart';

class GradeBloc extends Bloc<GradeEvent, GradeState> {
  PostGradeByStudentIdUseCase gradeByStudentIdUseCase;

  GradeBloc(this.gradeByStudentIdUseCase)
      : super(
          const GradeInitialState(),
        ) {
    on<GradeSaveEvent>((event, emit) async {
      emit(const GradeLoadingState());
      final errorOrSuccess =
          await gradeByStudentIdUseCase.call(event.gradeEntity);
      errorOrSuccess.fold(
        (l) => emit(
          GradeErrorState(
            message: AppUtils.mapFailureToMessage(l),
          ),
        ),
        (r) => emit(
          const GradeLoadedState(),
        ),
      );
    });
  }
}
