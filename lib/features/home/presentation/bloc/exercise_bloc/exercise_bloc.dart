import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/exercise_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/usecases/get_exercise_by_hw_id.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'exercise_event.dart';

part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  GetExerciseByHWIdUseCase getExerciseByHWIdUseCase;

  ExerciseBloc(this.getExerciseByHWIdUseCase) : super(ExerciseInitialState()) {
    on<ExerciseGetEvent>((event, emit) async {
      emit(ExerciseLoadingState());
      final errorOrSuccess = await getExerciseByHWIdUseCase.call(event.id);
      errorOrSuccess.fold(
        (l) => emit(
          ExerciseErrorState(message: AppUtils.mapFailureToMessage(l)),
        ),
        (r) => emit(ExerciseLoadedState(exercise: r)),
      );
    });
  }
}
